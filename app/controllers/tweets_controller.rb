class TweetsController < ApplicationController
  def new
  	@tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params[:tweet])

    if @tweet.save

      # Tweet from gem
      Twitter.update(@tweet.text)

      flash[:success] = "Tweet created!"
      redirect_to tweets_path
    else
      flash.now[:error] = "You must complete the field."
      render 'new'
    end
  end

  def edit
  end

  def index
    @tweets = Tweet.paginate(page: params[:page])
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
end
