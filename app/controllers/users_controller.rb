class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    if params[:type] == "developer"
      @users = User.developers
    elsif params[:type] == "designer"
      @users = User.designers
    elsif params[:type] == "other"
      @users = User.where(available: true).where(talent_type: "other")
    else
      @users = User.where(available: true)
    end
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
