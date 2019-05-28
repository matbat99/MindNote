class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
      t.boolean :active, default: false
      t.float :easiness_factor, default: 2.5
      t.integer :repetition, default: 0
      t.integer :interval, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
