class CreateFinalTweets < ActiveRecord::Migration
  def change
    create_table :final_tweets do |t|

      t.string :text, :limit => 140
      t.datetime :created_at
    end
  end
end
