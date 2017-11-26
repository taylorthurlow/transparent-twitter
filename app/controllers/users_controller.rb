class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  respond_to :html

  def create
    @user = User.new(user_params)
    @user.save
    respond_with(@user)
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  def reindex_friends
    IndexFriendsService.new(current_user.id).call
    redirect_to root_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:provider, :uid, :name, :token, :secret, :profile_image)
  end
end
