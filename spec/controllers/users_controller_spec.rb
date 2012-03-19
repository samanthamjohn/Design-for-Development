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
      sign_in user
      get :edit, id: user.to_param
      assigns(:user).should == user
      assigns(:user).available.should be
    end
  end

  describe "update" do
    context "valid params" do
     it "renders the show page" do
        user = create(:user)
        sign_in user
        put :update, id: user.to_param, user: {about: "foo", looking_for: "bar",
                                               city: "baz", talent_type: "other",
                                               available: true, name: "Sam"}
        user.reload.about.should == "foo"
        response.should redirect_to user_path(user)
     end

     it "removes blank links" do
       user = create(:user)
       sign_in user
       put :update, id: user.to_param, user: {
         "links_attributes"=>{"0"=>{"name"=>"", "url"=>""}}
       }
       user.reload.links.should be_empty
       response.should redirect_to user_path(user)
     end
    end
    context "invalid params" do
      it "renders the edit page with errors" do
        user = create(:user)
        sign_in user
        put :update, id: user.to_param, user: {available: true}
        response.should render_template(:edit)
      end
    end
  end

  describe "show" do
    it "should assign the user" do
      user = create(:user)
      get :show, id: user.to_param
      response.should be_success
    end
  end
end
