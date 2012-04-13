require 'spec_helper'

describe "Authors" do
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

  describe "GET /authors" do
    it "should return success" do 
      # TODO: I'm not sure if I really want to keep using request specs here.
      pending
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get authors_path
      response.status.should be(200)
    end
  end
end
