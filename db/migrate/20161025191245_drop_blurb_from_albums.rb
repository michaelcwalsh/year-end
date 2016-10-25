class DropBlurbFromAlbums < ActiveRecord::Migration[5.0]
  def up
    remove_column :albums, :blurb, :string
  end

  def down
    add_column :albums, :blurb, :string
  end
end
