class AddUpvotedAndDownvotedToIPAddress < ActiveRecord::Migration
  def change
  	remove_column :ip_addresses, :voted

  	add_column :ip_addresses, :upvoted, :boolean, default: false
  	add_column :ip_addresses, :downvoted, :boolean, default: false
  end
end
