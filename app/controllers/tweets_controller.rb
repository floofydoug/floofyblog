class TweetsController < ApplicationController
  def new
  	@tweet = Tweet.new
  end

  def create
    if current_user
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
    else
      flash[:error] = "You must sign in to Twitter to submit a tweet."
      redirect_to root_url
    end
  end

  def upvote
    if current_user
      @tweet = Tweet.find_by_id(params[:id])

      # Did the user already upvote this tweet?
      if current_user.voted_up_on? @tweet
        flash[:error] = "You already upvoted this tweet."
        redirect_to root_url
      
      # Did the user already downvote this tweet?
      else
        @tweet.upvote_from current_user
        flash[:success] = "Upvote successful!"
        @tweet.score = @tweet.upvotes.size - @tweet.downvotes.size
        @tweet.save
        redirect_to root_url
      end
    else
      flash[:error] = "You must sign in to Twitter to vote."
      redirect_to root_url
    end
  end

  def downvote
    if current_user
      @tweet = Tweet.find_by_id(params[:id])
        
      # Did the user already downvote this tweet?
      if current_user.voted_down_on? @tweet
        flash[:error] = "You already downvoted this tweet."
        redirect_to root_url
      
      # Did the user already downvote this tweet?
      else
        @tweet.downvote_from current_user
        flash[:success] = "Downvote successful!"
        @tweet.score = @tweet.upvotes.size - @tweet.downvotes.size
        @tweet.save
        redirect_to root_url  
      end
    else
      flash[:error] = "You must sign in to Twitter to vote."
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