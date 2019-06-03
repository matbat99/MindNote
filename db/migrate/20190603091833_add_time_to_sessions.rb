class AddTimeToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :time, :integer
  end
end
