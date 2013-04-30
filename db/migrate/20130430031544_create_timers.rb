class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.datetime :start
      t.datetime :end
    end
  end
end
