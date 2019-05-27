class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :practice, foreign_key: true
      t.integer :grade

      t.timestamps
    end
  end
end
