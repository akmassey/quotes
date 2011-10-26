require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FortuneParser do 
  before :each do 
    @fortune_file = <<FORTUNE
%
"Time flies like an arrow; fruit flies like a banana."
    -- Groucho Marx
%
"If all else fails, immortality can always be assured by spectacular
error."
    -- John Kenneth Galbraith
%
"Times have not become more violent.  They have just become more
televised."
    -- Marilyn Manson
%
"If one would give me six lines written by the hand of the most
honest man, I would find something in them to have him hanged."
    -- Cardinal Richelieu
%
"I would rather be exposed to the inconveniences attending too much
liberty than to those attending too small a degree of it."
    -- Thomas Jefferson
%
"Truth is the first casualty in war."
    -- Aeschylus
%
"Those who would give up essential liberty to purchase a little
temporary safety, deserve neither liberty nor safety."
    -- Benjamin Franklin
%
"We are what we pretend to be, so we must be careful what we pretend
to be."
    -- Kurt Vonnegut
%
FORTUNE
  end

  it "should parse a fortune file into an array of quote and author strings" do
    fp = FortuneParser.new
    fp.parse(@fortune_file)
    fp.count.should be 8
  end
end
