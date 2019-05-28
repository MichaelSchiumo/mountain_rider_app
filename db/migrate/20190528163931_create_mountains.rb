class CreateMountains < ActiveRecord::Migration[5.2]
  def change
    create_table :mountains do |t|

      t.timestamps
      t.string :name
      t.integer :difficulty
      t.integer :rank 

    end
  end
end
