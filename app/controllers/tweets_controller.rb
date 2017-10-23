class TweetsController < ApplicationController
  before_action :set_tweet, only: [:update, :destroy]
  respond_to :html, :json

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all.sort
    respond_with @tweets
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    respond_with @tweet, location: tweets_url
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    @tweet.update(tweet_params)
    respond_with @tweet, location: tweets_url
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_with @tweet, location: tweets_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:url, :text, :classification)
    end
end
