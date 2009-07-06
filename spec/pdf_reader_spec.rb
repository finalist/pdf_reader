require 'rubygems'
require 'spec'
Dir.glob(File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')).each { |f| require f }

describe PdfReaderSpec do
  it "should extract raw text from pdf" do
    p = PDFReader.new('test/test.pdf')
    p.raw_text.should eql('Test PDF, try and read me!')
  end
end
