class AddColorToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :color, :string, default: "#cococo"
  end
end
