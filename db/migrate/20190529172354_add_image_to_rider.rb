class AddImageToRider < ActiveRecord::Migration[5.2]
  def change
    add_column :riders, :image, :string
  end
end
