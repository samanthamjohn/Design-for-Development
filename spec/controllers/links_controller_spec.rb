require 'spec_helper'
describe LinksController do
  describe "destroy" do
    it "should remove the link" do
      link = create(:link)
      delete :destroy, id: link.id
      lambda {
        link.reload
      }.should raise_error(ActiveRecord::RecordNotFound)
      response.should redirect_to edit_user_path(link.user)
    end
  end
end
