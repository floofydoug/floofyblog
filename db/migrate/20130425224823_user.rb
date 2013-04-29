class CreateUser < ActiveRecord::Migration
  def up
    create_table :user do |t|

      t.string :provider
      t.integer :uid
      t.string :name
    end
  end
end
