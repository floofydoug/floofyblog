namespace :tweet do
  desc "Tweet and restart timer"
  task :schedule => :environment do
    
    # Update Timer start
    timer = Timer.first
    if !timer
      timer = Timer.new
      timer.start = Time.now
      # Add 10 minutes to end time
      timer.end = timer.start + 10 * 60 
      timer.save
    else
      timer.start = Time.now
      timer.end = timer.start + 10 * 60 
      timer.save
    end

    # All the scraping code you need to run goes here
    @tweet = Tweet.find(:all, :order => "score desc").first

    # Publish tweet
    if @tweet
      @final_tweet = FinalTweet.new
      @final_tweet.text = @tweet.text
      @final_tweet.score = @tweet.score
      @final_tweet.save

      # Tweet from gem
      Twitter.update(@final_tweet.text)

      # Remove all temporary tweets and IP addresses
      Tweet.delete_all
      IPAddress.delete_all
    end
  end
end
    
