class RenameRankingColumnInAlbums < ActiveRecord::Migration[5.0]
  def up
    rename_column :albums, :rank, :rating
  end

  def down
    rename_column :albums, :rating, :rank
  end
end
