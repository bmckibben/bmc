class AddNameToLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :logs, :name, :string
  end
end
