class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def edit
    @user.available = true
  end

  def update
    links = params[:user]["links_attributes"]
    unless links.blank?
      links = links.reject do |key, link|
        link["name"].blank? || link["url"].blank?
      end
      params[:user]["links_attributes"] = links
    end
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
  end
end
