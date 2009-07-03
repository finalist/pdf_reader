require 'test/unit'
require 'pdf_reader'

class TestPdfReader < Test::Unit::TestCase
  def test_raw_text
    p = PdfReader.new('test/test.pdf')
    assert_equal 'Test PDF, try and read me!', p.raw_text
  end
end
