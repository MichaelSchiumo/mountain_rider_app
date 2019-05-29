class AddUidToRider < ActiveRecord::Migration[5.2]
  def change
    add_column :riders, :uid, :string
  end
end
