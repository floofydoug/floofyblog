class TweetsController < ApplicationController
  def new
  	@tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params[:tweet])

    # Recaptcha implementation
    if verify_recaptcha(:model => @tweet) && @tweet.save

      # Tweet from gem
      Twitter.update(@tweet.text)

      flash[:success] = "Tweet submitted!"
      redirect_to root_url
    else
      flash[:error] = "You must complete every field."
      redirect_to root_url
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