class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|

      t.timestamps
      t.integer :rider_id
      t.integer :mountain_id
    end
  end
end
