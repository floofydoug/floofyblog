class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|

      t.string :text, :limit => 140
      t.datetime :created_at
    end
  end
end
