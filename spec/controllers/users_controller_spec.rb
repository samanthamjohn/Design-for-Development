require 'spec_helper'

describe UsersController do

  describe "index" do
    it "should show all the users" do
      user = create(:available_user)
      unavailable_user = create(:user)
      get :index
      assigns(:users).should == [user]
    end

    context "a type param is passed in" do
      it "should show all developers" do
        developer = create(:available_user, talent_type: "developer")
        other = create(:available_user, talent_type: "other")
        designer = create(:available_user, talent_type: "designer")
        both = create(:available_user, talent_type: "both")
        get :index, type: "designer"
        assigns(:users).should =~ [designer, both]
        get :index, type: "developer"
        assigns(:users).should =~ [developer, both]
        get :index, type: "other"
        assigns(:users).should =~ [other]
      end
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

     it "accepts non blank links" do
       user = create(:user)
       sign_in user
       put :update, id: user.to_param, user: {
         "links_attributes"=>{"0"=>{"name"=>"Foo", "url"=>"https://github.com/samjohn"}}
       }
       user.reload.links.length.should == 1
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
