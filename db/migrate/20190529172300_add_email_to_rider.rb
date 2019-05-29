class AddEmailToRider < ActiveRecord::Migration[5.2]
  def change
    add_column :riders, :email, :string
  end
end
