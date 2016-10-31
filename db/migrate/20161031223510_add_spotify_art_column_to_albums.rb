class AddSpotifyArtColumnToAlbums < ActiveRecord::Migration[5.0]
  def up
    add_column :albums, :spotify_art, :string
  end
  
  def down
    remove_column :albums, :spotify_art, :string
  end
end
