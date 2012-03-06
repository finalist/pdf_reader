Dir.glob(File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')).each { |f| require f }

describe PDFReader do

  it "should extract raw text from pdf" do
    p = PDFReader.new('spec/test.pdf')
    p.raw_text.should eql('Test PDF, try and read me!')
  end

  it "handles header checks" do
    pending
    p = PDFReader.new('spec/troublesome.pdf')
    p.raw_text.should include "Release Note"
  end

end
