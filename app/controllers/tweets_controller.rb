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
      flash[:error] = "You already submitted a tweet. Please wait until the next session to submit again."
      redirect_to root_url

    # Else if IP exists but has not tweeted, submit tweet
    elsif @ip_address && !@ip_address.tweeted
      
      # Recaptcha implementation
      if @tweet.save
        @ip_address.tweeted = true
        @ip_address.save
        flash[:success] = "Tweet submitted!"
        redirect_to root_url
      else
        flash[:error] = "You must have something to say..."
        redirect_to root_url
      end

    # Else if IP does not exist, create IP and submit tweet
    elsif !@ip_address
      
      # Recaptcha implementation
      if @tweet.save
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

  def upvote
    @tweet = Tweet.find_by_id(params[:id])

    # Get current IP address
    current_ip = request.remote_ip
    
    # Does IP exist in database?
    @ip_address = IPAddress.find_by_ip(current_ip)
    
    # If IP exists and already upvoted, do nothing
    if @ip_address && @ip_address.upvoted && @tweet
      flash[:error] = "You already upvoted. Please wait until the next session to upvote again."
      redirect_to root_url

    # Else if IP exists but has not upvoted, upvote
    elsif @ip_address && !@ip_address.upvoted
      
      @ip_address.upvoted = true
      @ip_address.save

      @tweet.score = @tweet.score + 1
      @tweet.save

      flash[:success] = "Upvote successful!"
      redirect_to root_url

    # Else if IP does not exist, create IP and upvote
    elsif !@ip_address
      
      @ip_address = IPAddress.new
      @ip_address.ip = current_ip
      @ip_address.upvoted = true
      @ip_address.save

      flash[:success] = "Upvote successful!"
      redirect_to root_url
    end
  end

  def downvote
    @tweet = Tweet.find_by_id(params[:id])

    # Get current IP address
    current_ip = request.remote_ip
    
    # Does IP exist in database?
    @ip_address = IPAddress.find_by_ip(current_ip)
    
    # If IP exists and already downvoted, do nothing
    if @ip_address && @ip_address.downvoted
      flash[:error] = "You already downvoted. Please wait until the next session to downvote again."
      redirect_to root_url

    # Else if IP exists but has not upvoted, upvote
    elsif @ip_address && !@ip_address.downvoted
      
      @ip_address.downvoted = true
      @ip_address.save

      @tweet.score = @tweet.score - 1
      @tweet.save

      flash[:success] = "Downvote successful!"
      redirect_to root_url

    # Else if IP does not exist, create IP and upvote
    elsif !@ip_address
      
      @ip_address = IPAddress.new
      @ip_address.ip = current_ip
      @ip_address.downvoted = true
      @ip_address.save

      flash[:success] = "Downvote successful!"
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