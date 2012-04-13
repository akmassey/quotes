require 'spec_helper'

describe "quotes/index", :type => :request do
  include Devise::TestHelpers

  before(:each) do
    @author = Factory.create(:author) 
    @quote = Factory.create(:quote, :author => @author)
    @quotes = [ @quote ]
    @user = Factory.create(:user)
    sign_in @user
  end

  it "renders a list of quotes" do
    render
    #TODO: Is it not picking up the title helper here?
    #rendered.should have_content "Listing Quotes"
    rendered.should have_content "Text"
    rendered.should have_content "Author"
    rendered.should have_content "Source URL"
  end

  it "displays a couple of quotes" do 
    render

    rendered.should have_content "This is a test quotation."
    rendered.should have_content "Test Author"
  end
end
