class AddUpvotedAndDownvotedToIPAddresses < ActiveRecord::Migration
  def change
  	add_column :ip_addresses, :upvoted, :boolean, default: false
  	add_column :ip_addresses, :downvoted, :boolean, default: false
  end
end
