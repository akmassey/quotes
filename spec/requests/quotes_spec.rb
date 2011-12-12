require 'spec_helper'

describe "Quotes" do
  before(:each) do
    @author = Factory.create(:author) 
    @quote = Factory.create(:quote, :author => @author)
    @quotes = [ @quote ]
    @user = Factory.create(:user)

    # Sign in as a user
    visit new_user_session_path
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => 'password'
    click_button 'Sign in'
  end

  it "index renders a list of quotes" do
    visit quotes_path

    page.should have_content "Listing Quotes"
    page.should have_content "This is a test quotation."
    page.should have_content "Test Author"
  end

  it "new quote page allows creation of quotes" do
    visit new_quote_path

    page.should have_content "New Quote"

    fill_in 'Text', :with => 'Real artists ship.'
    fill_in 'Name', :with => 'Steve Jobs'

    click_button 'Create Quote'

    page.should have_content 'Quote was successfully created.'
    page.should have_content 'Real artists ship.'
    page.should have_content 'Steve Jobs'
  end

  it "edit quote page allows quotes to be edited" do
    visit edit_quote_path(@quote)

    page.should have_content 'Editing Quote'

    fill_in 'Text', :with => 'The test quotation has been edited.'
    fill_in 'Name', :with => 'Another Author'

    click_button 'Update Quote'

    page.should have_content 'Quote was successfully updated.'
    page.should have_content 'The test quotation has been edited.'
    page.should have_content 'Another Author'
  end
end
