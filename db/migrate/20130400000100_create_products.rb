class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :type, null: false

      t.integer :master_id

      t.boolean :approved, null: false, default: false
      t.boolean :declined, null: false, default: false
      t.boolean :pending, null: false, default: true

      t.integer :organization_id

      t.integer :upload_id

      t.string :name, null: false, default: ""
      t.string :ean13
      t.string :website
      t.string :facebook_id
      t.string :facebook_alias
      t.string :twitter_alias

    end
    add_index :products, :type
    add_index :products, :approved
    add_index :products, :pending
    add_index :products, :organization_id, where: "approved IS TRUE AND type = 'Product::Master'"
    add_index :products, :name, where: "approved IS TRUE AND type = 'Product::Master'"
  end
end
