class CreateRiders < ActiveRecord::Migration[5.2]
  def change
    create_table :riders do |t|

      t.timestamps
      t.string :name
      t.string :password
      t.integer :experience
      t.string :stance
      t.integer :ticket_number
    end
  end
end
