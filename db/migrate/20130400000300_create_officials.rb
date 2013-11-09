class CreateOfficials < ActiveRecord::Migration
  def change
    create_table :officials do |t|
      t.string :type, null: false

      t.integer :master_id

      t.boolean :approved, null: false, default: false
      t.boolean :declined, null: false, default: false
      t.boolean :pending, null: false, default: true

      t.integer :organization_id

      t.integer :upload_id

      t.string :name, null: false, default: ""
      t.text :bio
      t.string :website
      t.string :facebook_id
      t.string :facebook_alias
      t.string :twitter_alias
    end
    add_index :officials, :type
    add_index :officials, :approved
    add_index :officials, :pending
    add_index :officials, :name, where: "approved IS TRUE AND type = 'Official::Master'"
  end
end
