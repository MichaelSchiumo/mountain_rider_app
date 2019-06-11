class RemovePasswordEmailImageFromRiders < ActiveRecord::Migration[5.2]
  def change
    remove_column :riders, :password, :string
    remove_column :riders, :email, :string
    remove_column :riders, :image, :string
  end
end
