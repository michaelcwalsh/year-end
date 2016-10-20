class RenameAlbumsTable < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :movies, :albums
  end
  def self.down
    rename_table :albums, :movies
  end
end
