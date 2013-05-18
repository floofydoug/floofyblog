class AddUsernamesToTweets < ActiveRecord::Migration
  def change
  	add_column :tweets, :username, :string
  	add_column :final_tweets, :username, :string
  end
end
