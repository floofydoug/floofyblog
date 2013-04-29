class FinalTweetsController < ApplicationController
  def index
    @final_tweets = FinalTweet.paginate(page: params[:page], :per_page => 25, :order=>"created_at DESC")
  end
end