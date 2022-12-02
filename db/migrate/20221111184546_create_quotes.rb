class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.string :name, null: false
      t.string :author
      t.boolean :active, default: 0

      t.timestamps
    end
  end
end
