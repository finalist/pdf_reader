require 'zlib'

class PDFReader
  def initialize(file)
    @file = file
  end

  # extracts all raw text
  def raw_text
    text = ''

    objects = get_objects(get_data(@file))
    objects = decode_objects(objects)

    objects.each { |o| text += o[:data] if(o[:data] and is_text_header?(o[:header])) }

    text
  end

  private

  # decodes all given chunks to readable text
  def decode_objects(objects)
    objects.collect do |o|
      if(o[:data])
        o = inflate_object(o) if(is_object_deflated?(o))
        o[:data] = postscript_to_text(o[:data])
      end
    end

    objects.compact
  end

  # checks whetever the PDF header is a textual header or not
  def is_text_header?(header)
    not header.include?('/Subtype') and not header.match(/\/Length[1-3]+/)
  end

  # parse postscript
  def postscript_to_text(data)
    #result      = ''
    #get_block_data(data, /BT\s/, /\sET/, 3).each do |b|
    #  result += get_text(data)
    #end
    get_text(data)
  end

  # extracts text from a chunk
  def get_text(chunk)
    text_parts  = get_block_data(chunk, /\(/, /\)/, 1)
    result      = ''

    # everything between ()'s is text
    unless text_parts.empty?
      text_parts.each do |t|
        result += t[1..-2]
      end
    end

    return result
  end

  # deflates a chunk if it is compressed
  def inflate_object(object)
    z = Zlib::Inflate.new()
    object[:data] = z.inflate(object[:data])
    z.close

    return object
  end

  # tests if a chunk is compressed
  def is_object_deflated?(object)
    object[:header].include?('FlateDecode')
  end

  # retrieve raw chunks from given string
  def get_objects(data)
    get_block_data(data, /obj/, /endobj/, 6).collect { |o| get_chunk(o) }.compact
  end

  # retrieves a chunk from an extracted object
  def get_chunk(object)
    chunk_headers = get_block_data(object, /<</, />>/, 2)

    return { :header => chunk_headers[0], :data => get_stream_data(object) } unless(chunk_headers.empty?)
  end

  # retrieves data beteween "stream" and "endstream" word
  def get_stream_data(object)
    start_word        = /stream(\n|\r\n)/
      end_word          = /endstream/
      start_word_length = 7
    end_word_length   = 9
    stream_objects    = get_block_data(object, start_word, end_word, end_word_length)

    unless(stream_objects.empty?)
      start_index   = stream_objects[0].index(start_word)
      end_index     = stream_objects[0].index(end_word)

      # tricky stuff
      start_word_length = 8 if(stream_objects[0][1..8] == "stream\r\n")

      # extract 1 byte extra because endstream can have 1 random byte as end character (rtfm)
      data = stream_objects[0].slice(start_word_length, stream_objects[0].length - start_word_length - end_word_length - 1)
    end

    return data unless data.nil?
  end

  # returns whole file contents
  def get_data(file)
    f = File.open(file, 'rb')
    buffer = f.read
    f.close

    buffer
  end

  # retrieves objects from given string
  def get_block_data(data, start_word, end_word, end_word_length)
    objects     = []
    start_index = 0
    end_index   = 0

    # this is a bit of cheesy... if someone knows a better way to do this?
    while(not start_index.nil? and not end_index.nil?) do
      start_index = data.index(start_word, end_index)

      unless(start_index.nil?)
        end_index = data.index(end_word, start_index)

        unless(end_index.nil?)
          objects.push(data.slice(start_index, end_index - start_index + end_word_length))
        end
      end
    end

    objects
  end
end
