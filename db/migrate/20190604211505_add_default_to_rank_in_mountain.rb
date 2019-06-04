class AddDefaultToRankInMountain < ActiveRecord::Migration[5.2]
  def change
    change_column_default :mountains, :rank, 0
  end
end
