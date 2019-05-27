class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.references :artist, foreign_key: true
      t.string :album_url

      t.timestamps
    end
  end
end
