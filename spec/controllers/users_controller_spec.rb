require 'spec_helper'

describe UsersController do

  describe "index" do
    it "should show all the users" do
      user = create(:user)
      get :index
      assigns(:users).should include(user)
    end
  end

  describe "edit" do
    it "should render the edit page" do
      user = create(:user)
      get :edit, id: user.to_param
      assigns(:user).should == user
    end
  end
end
