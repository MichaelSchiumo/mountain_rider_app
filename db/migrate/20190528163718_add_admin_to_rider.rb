class AddAdminToRider < ActiveRecord::Migration[5.2]
  def change
    add_column :riders, :admin, :boolean, default: false
  end
end
