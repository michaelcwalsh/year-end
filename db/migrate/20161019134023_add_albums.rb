class AddAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.string :artist, null: false
      t.string :year, null: false
      t.string :rank, null: false
      t.string :art
      t.text :notes
      t.text :blurb
      t.timestamps null: false
    end
  end
end
