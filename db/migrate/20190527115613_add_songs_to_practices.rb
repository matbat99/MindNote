class AddSongsToPractices < ActiveRecord::Migration[5.2]
  def change
    add_reference :practices, :song, foreign_key: true
  end
end
