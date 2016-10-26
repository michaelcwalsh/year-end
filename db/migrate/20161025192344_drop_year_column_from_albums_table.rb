class DropYearColumnFromAlbumsTable < ActiveRecord::Migration[5.0]
  def up
    remove_column :albums, :year, :string
  end

  def down
    add_column :albums, :year, :string
  end
end
