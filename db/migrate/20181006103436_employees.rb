class Employees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.integer :employee_no
      t.integer :lohn_manager_id
      t.string :email
 
      t.timestamps
    end
  end
end
