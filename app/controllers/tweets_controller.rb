class TweetsController < ApplicationController
  def new
  	@tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params[:tweet])
    @tweet.score = 0

    # Get current IP address
    current_ip = request.remote_ip
    
    # Does IP exist in database?
    @ip_address = IPAddress.find_by_ip(current_ip)
    
    # If IP exists and already tweeted, do nothing
    if @ip_address && @ip_address.tweeted
      flash[:error] = "You have already submitted a tweet. Please wait until the current session ends to submit another."
      redirect_to root_url

    # Else if IP exists but has not tweeted, submit tweet
    elsif @ip_address && !@ip_address.tweeted
      
      # Recaptcha implementation
      if verify_recaptcha(:model => @tweet) && @tweet.save
        @ip_address.tweeted = true
        @ip_address.save
        flash[:success] = "Tweet submitted!"
        redirect_to root_url
      else
        flash[:error] = "You must complete every field."
        redirect_to root_url
      end

    # Else if IP does not exist, create IP and submit tweet
    elsif !@ip_address
      
      # Recaptcha implementation
      if verify_recaptcha(:model => @tweet) && @tweet.save
        @ip_address = IPAddress.new
        @ip_address.ip = current_ip
        @ip_address.tweeted = true
        @ip_address.save

        # Tweet from gem
        # Twitter.update(@tweet.text)

        flash[:success] = "Tweet submitted!"
        redirect_to root_url
      else
        flash[:error] = "You must complete every field."
        redirect_to root_url
      end
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