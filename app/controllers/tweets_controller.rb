class TweetsController < ApplicationController
  before_action :set_tweet, only: [:update, :destroy]
  respond_to :html, :json

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all.unclassified.sort
    respond_with @tweets
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    respond_with @tweet, location: tweets_url
  end

  # GET /create_training_data
  # GET /create_training_data.json
  def create_training_data
    client = twitter_init
    search = client.search('', lang: 'en', geocode: '34.057565,-117.820741,10mi').take(10)
    search.each {|t| Tweet.batch_factory(t)}
    redirect_to tweets_url
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    @tweet.update(tweet_params)
    respond_with @tweet, location: trainer_url
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_with @tweet, location: trainer_ur
l  end

  private

    def twitter_init
      return Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['SECRET_CONSUMER_KEY']
        config.consumer_secret = ENV['SECRET_CONSUMER_SECRET']
        config.access_token = ENV['SECRET_ACCESS_TOKEN']
        config.access_token_secret = ENV['SECRET_ACCESS_TOKEN_SECRET']
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:tweet_id, :tweet_url, :tweet_text, :user_name, :user_handle, :user_picture_url, :classification)
    end
end
