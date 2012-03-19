class LinksController < ApplicationController

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to edit_user_path(@link.user)
  end

end
