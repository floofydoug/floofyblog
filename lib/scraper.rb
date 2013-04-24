class Scraper
  def perform
    # All the scraping code you need to run goes here
    @tweet = Tweet.find(:all, :order => "score desc").first

    # Publish tweet
    @final_tweet = FinalTweet.new
    @final_tweet.text = @tweet.text
    @final_tweet.score = @tweet.score
    @final_tweet.save

    # Tweet from gem
    Twitter.update(@final_tweet.text)

    # Remove all temporary tweets and IP addresses
    Tweet.delete_all
    IP_address.delete_all
  end

  def error(job, exception)
    # Send a warning email to yourself, or whatever.
    # The scraping will automatically be retried.
  end

  def success(job)
    # Schedule the next scraping.
    Delayed::Job.enqueue(Scraper.new, :run_at => 15.minutes.from_now)
  end
end

# In the Heroku console, run
# Scraper.new.perform