require 'pdf_reader'

describe PDFReader::VERSION do

  it "exists" do
    subject.should =~ /^\d+\.\d+\.\d+/
  end

end
