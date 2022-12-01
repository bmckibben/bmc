class AddFieldsToQuotes < ActiveRecord::Migration[7.0]
  def change
  	add_column :quotes, :active, :boolean, default: 0
  	add_column :quotes, :author, :string  
  end
end
