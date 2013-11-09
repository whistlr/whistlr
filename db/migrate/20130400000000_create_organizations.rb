class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :type, null: false

      t.integer :master_id

      t.boolean :approved, null: false, default: false
      t.boolean :declined, null: false, default: false
      t.boolean :pending, null: false, default: true

      t.integer :parent_id

      t.integer :upload_id

      t.string :name, null: false
      t.string :country
      t.string :region
      t.string :city
      t.string :website
      t.string :facebook_id
      t.string :facebook_alias
      t.string :twitter_alias
      
    end
    add_index :organizations, :type
    add_index :organizations, :approved
    add_index :organizations, :pending
    add_index :organizations, [:country, :region, :city], where: "approved IS TRUE AND type = 'Organization::Master'"
    add_index :organizations, :parent_id, where: "approved IS TRUE AND type = 'Organization::Master'"
    add_index :organizations, :name, where: "approved IS TRUE AND type = 'Organization::Master'"
  end
end