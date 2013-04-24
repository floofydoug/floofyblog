class CreateIPAddress < ActiveRecord::Migration
  def change
    create_table :ip_addresses do |t|

      t.string :ip, :limit => 45
      t.boolean :tweeted, default: false
      t.datetime :created_at
    end
  end
end
