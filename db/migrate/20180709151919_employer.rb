class Employer < ActiveRecord::Migration[5.2]
  def change
  	create_table :employers do |t|
      t.string :name
      t.string :address
      t.string :contact_person
      t.string :telephone
      t.string :email
      t.string :website
      t.integer :night_addition_in_percent
      t.integer :sunday_addition_in_percent
      t.integer :holiday_addition_in_percent
 
      t.timestamps
    end
  end
end
