class StaticPagesController < ApplicationController
  respond_to :html

  def home; end

  def results
    @results = params[:results]
    @twitter_user = TwitterUser.find(params[:twitter_user_id])
  end
end
