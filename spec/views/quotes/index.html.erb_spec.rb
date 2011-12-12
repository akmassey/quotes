require 'spec_helper'

describe "quotes/index.html.erb", :type => :request do
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
    rendered.should have_content "Listing Quotes"
  end

  it "should be able to visit the quotes path" do
    visit quotes_path
  end

  it "displays a couple of quotes" do 
    assign(:authors, [ 
      stub_model(Author, :name => "Awesome")
    ])

    @first = Author.first

    assign(:quotes, [
      stub_model(Quote, :text => "This is a quote.", :author => @first),
      stub_model(Quote, :text => "This is another quote.", :author => @first)
    ])

    render

    rendered.should have_content "This is a quote."
    rendered.should have_content "This is another quote."
  end
end
