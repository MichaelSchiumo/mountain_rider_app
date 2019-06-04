class AddTopRankedToMountain < ActiveRecord::Migration[5.2]
  def change
    add_column :mountains, :top_rank, :integer
  end
end
