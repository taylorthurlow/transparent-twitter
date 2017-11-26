class WatsonController < ApplicationController
  def analyze_user
    result = check_user(params[:id].to_i)
    redirect_to results_path(results: result)
  end

  private

  def check_user(user, num_tweets = 200)
    list = build_tweet_list(user, num_tweets)
    response = check_tone(list)
    return response['document_tone']
  end

  def build_tweet_list(user, num_tweets = 200)
    tweets = current_user.twitter.user_timeline(user, count: num_tweets, tweet_mode: 'extended')
    return tweets.map { |t| t.attrs[:full_text] }.join("\n").gsub(/[\u0080-\u00ff]/, '')
  end

  def check_tone(text_body)
    response = RestClient::Request.new(
      method: :post,
      url: 'https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone',
      user: ENV['IBM_USERNAME'],
      password: ENV['IBM_PASSWORD'],
      payload: text_body,
      headers: {
        content_type: 'text/plain',
        params: {
          version: '2017-09-21',
          sentences: false
        }
      }
    ).execute

    return JSON.parse(response)
  rescue RestClient::ExceptionWithResponse => err
    puts "REQUEST TO WATSON API FAILED: #{err}"
  end
end
