class CreateProductEans < ActiveRecord::Migration
  def change
    create_table :product_eans do |t|
      t.string :code, null: false

      t.integer :previous_id
    end
    add_index :product_eans, :code
  end
end
