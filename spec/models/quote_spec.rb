require 'spec_helper'

describe Quote do

  context "when created with valid attributes" do 
    quote = Quote.new({text: "Here's a quote."})

    it "should be created with valid attributes" do 
      quote.should be_valid
    end

    it "should be able to be saved and retrieved" do 
      quote.save!
      Quote.first.should eq quote
    end
  end
end
