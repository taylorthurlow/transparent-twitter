class StaticPagesController < ApplicationController
  respond_to :html

  def home; end

  def results
    @results = params[:results]
  end
end
