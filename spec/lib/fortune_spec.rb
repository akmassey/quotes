require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'fortune'
require 'database_cleaner'

describe "Fortune" do 
  before :each do 
    DatabaseCleaner.strategy = :truncation 
    DatabaseCleaner.clean

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

    @bad_fortune = <<MALFORMED
%
"Time flies like an arrow; fruit flies like a banana."
%
"If all else fails, immortality can always be assured by spectacular 
error."
    -- John Kenneth Galbraith
%
    -- Marilyn Manson
%
MALFORMED

    @fortune = Fortune.new(@fortune_file)
  end

  it "should parse the file into an array with the correct number of quotes" do
    @fortune.count.should be 8
  end

  it "should properly identify authors" do 
    @fortune.author(0).name.should eq("Groucho Marx")
    @fortune.author(1).name.should eq("John Kenneth Galbraith")
    @fortune.author(2).name.should eq("Marilyn Manson")
    @fortune.author(3).name.should eq("Cardinal Richelieu")
    @fortune.author(4).name.should eq("Thomas Jefferson")
    @fortune.author(5).name.should eq("Aeschylus")
    @fortune.author(6).name.should eq("Benjamin Franklin")
    @fortune.author(7).name.should eq("Kurt Vonnegut")
  end

  it "should properly identify quotes" do
    @fortune.quote(0).text.should eq("Time flies like an arrow; fruit flies like a banana.")
    @fortune.quote(1).text.should eq("If all else fails, immortality can always be assured by spectacular error.")
    @fortune.quote(7).text.should eq("We are what we pretend to be, so we must be careful what we pretend to be.")
  end

  it "should create an array of author objects" do
    @authors = @fortune.authors

    @authors[0].name.should eq("Groucho Marx")
    @authors[1].name.should eq("John Kenneth Galbraith")
    @authors[2].name.should eq("Marilyn Manson")
    @authors[3].name.should eq("Cardinal Richelieu")
    @authors[4].name.should eq("Thomas Jefferson")
    @authors[5].name.should eq("Aeschylus")
    @authors[6].name.should eq("Benjamin Franklin")
    @authors[7].name.should eq("Kurt Vonnegut")
  end

  it "should create an array of quote objects" do 
    @quotes = @fortune.quotes

    @quotes[0].text.should eq("Time flies like an arrow; fruit flies like a banana.")
    @quotes[1].text.should eq("If all else fails, immortality can always be assured by spectacular error.")
    @quotes[7].text.should eq("We are what we pretend to be, so we must be careful what we pretend to be.")

    @quotes[0].author.name.should eq("Groucho Marx")
    @quotes[1].author.name.should eq("John Kenneth Galbraith")
    @quotes[2].author.name.should eq("Marilyn Manson")
    @quotes[3].author.name.should eq("Cardinal Richelieu")
    @quotes[4].author.name.should eq("Thomas Jefferson")
    @quotes[5].author.name.should eq("Aeschylus")
    @quotes[6].author.name.should eq("Benjamin Franklin")
    @quotes[7].author.name.should eq("Kurt Vonnegut")
  end
  
  it "should fail when provided a malformed fortune file" do
    # TODO: finish this example
    @fortune = Fortune.new(@bad_fortune)
    
    @fortune.count.should be 8
  end    
  
  it "should load from a new fortune file when asked" do
    # TODO: finish this example
    @fortune.load_from_fortune_file(@fortune_file)
    
    @fortune.count.should be 8
  end
end
