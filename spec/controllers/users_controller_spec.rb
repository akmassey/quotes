require 'spec_helper'

describe UsersController do
  login_user

  describe "GET 'show'" do
    it "should be successful" do
      get :show, :id => subject.current_user.id
      response.should be_success
    end
  end
end
