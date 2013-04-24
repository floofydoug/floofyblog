class AddScoreToFinalTweets < ActiveRecord::Migration
  def change
  	add_column :final_tweets, :score, :integer
  end
end
