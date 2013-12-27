class CreateProductEanJoins < ActiveRecord::Migration
  def change
    create_table :product_ean_joins do |t|
      t.integer :product_id, null: false
      t.integer :ean_id, null: false
    end

    add_index :product_ean_joins, :product_id
    add_index :product_ean_joins, :ean_id
  end
end
