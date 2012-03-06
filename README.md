# PDF Reader

[![Build Status](https://secure.travis-ci.org/finalist/pdf_reader.png?branch=master)](http://travis-ci.org/finalist/pdf_reader)

Gem that gives you the "power" to extract raw text from a PDF.

## Installation

Add this line to your application's Gemfile:

    gem 'pdf_reader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pdf_reader

## Usage

Create a new object and call `raw_text`:

    p = PDFReader.new('test.pdf')
    puts p.raw_text

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Copyright 2009, Diederick Lawson - Finalist IT Group. Released under the MIT License.
