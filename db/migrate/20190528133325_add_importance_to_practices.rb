class AddImportanceToPractices < ActiveRecord::Migration[5.2]
  def change
    add_column :practices, :importance, :integer, default: 0
  end
end
