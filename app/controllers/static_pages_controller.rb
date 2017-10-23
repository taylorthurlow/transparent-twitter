class StaticPagesController < ApplicationController
  respond_to :html

  def home
  end

  def trainer
    unclassified = Tweet.unclassified
    if unclassified.any?
      @tweet = unclassified.offset(rand(unclassified.count)).first
      respond_with @tweet
    end
  end
end
