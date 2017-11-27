class TwitterUsersController < ApplicationController
  before_action :set_twitter_user, only: [:update, :destroy]

  respond_to :html

  def create
    @twitter_user = TwitterUser.new(twitter_user_params)
    @twitter_user.save
    respond_with(@twitter_user)
  end

  def update
    @twitter_user.update(twitter_user_params)
    respond_with(@twitter_user)
  end

  def destroy
    @twitter_user.destroy
    respond_with(@twitter_user)
  end

  private

  def set_twitter_user
    @twitter_user = TwitterUser.find(params[:id])
  end

  def twitter_user_params
    params.require(:twitter_user).permit(:uid, :name, :screen_name, :profile_image)
  end
end
