class Orders < ActiveRecord::Migration[5.2]
  def change
  	create_table :orders do |t|
      t.references :employer
      t.references :employee
      t.time :start_time
      t.time :end_time
      t.date :date
      t.integer :working_hours
      t.float :hourly_compensation
      t.float :employee_hourly_compensation
      t.integer :break_in_minutes
 
      t.timestamps
    end
  end
end
