require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Fortune do 
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
    f = Fortune.new
    f.parse(@fortune_file)
    f.count.should be 8
  end

  it "should properly identify authors" do 
    f = Fortune.new
    f.parse(@fortune_file)
    f.fortunes[0][:author].should eq("Groucho Marx")
    f.fortunes[1][:author].should eq("John Kenneth Galbraith")
    f.fortunes[4][:author].should eq("Thomas Jefferson")
    f.fortunes[5][:author].should eq("Aeschylus")
    f.fortunes[6][:author].should eq("Benjamin Franklin")
    f.fortunes[7][:author].should eq("Kurt Vonnegut")
  end

  it "should properly identify quotes" do
    f = Fortune.new
    f.parse(@fortune_file)
    f.fortunes[0][:quote].should eq("Time flies like an arrow; fruit flies like a banana.")
    f.fortunes[1][:quote].should eq("If all else fails, immortality can always be assured by spectacular error.")
    f.fortunes[7][:quote].should eq("We are what we pretend to be, so we must be careful what we pretend to be.")
  end
end
