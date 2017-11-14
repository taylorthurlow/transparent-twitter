require 'open-uri'

class WatsonController < ApplicationController
  respond_to :html

  def create_classifier
    FileUtils.mkpath Rails.root.join('tmp', 'csv')
    dl_path = download(params[:classifier][:dl_url], Rails.root.join('tmp', 'csv', params[:classifier][:name]))

    # classifier = Apollo::Bot::Classifier.create(
    #   training_data: File.new(dl_path),
    #   training_metadata: {
    #     language: 'en',
    #     name: params[:classifier][:name]
    #   }
    # )

    # debugger
    redirect_to tweets_url
  end

  private

  def download(url, path)
    File.open(path, 'w') do |f|
      IO.copy_stream(open(url), f)
    end

    return path
  end
end
