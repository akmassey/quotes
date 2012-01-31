require File.dirname(__FILE__) + '/../spec_helper'

describe Collection do
  it "should be valid" do
    Collection.new.should be_valid
  end
end
