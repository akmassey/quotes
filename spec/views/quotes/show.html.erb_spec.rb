require 'spec_helper'

describe "quotes/show.html.erb" do
  before(:each) do
    @quote = assign(:quote, stub_model(Quote))
  end

  it "renders attributes in <p>" do
    render
  end
end
