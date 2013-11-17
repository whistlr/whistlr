class DropPolicies < ActiveRecord::Migration
  def up
    drop_table :policies
  end

  def down
    create_table :policies do |t|
      t.string :type, null: false

      t.integer :master_id

      t.boolean :approved, null: false, default: false
      t.boolean :declined, null: false, default: false
      t.boolean :pending, null: false, default: true

      t.integer :organization_id

      t.integer :upload_id

      t.string :name, null: false, default: ""
    end
    add_index :policies, :type
    add_index :policies, :approved
    add_index :policies, :pending
    add_index :policies, :organization_id, where: "approved IS TRUE AND type = 'Policy::Master'"
    add_index :policies, :name, where: "approved IS TRUE AND type = 'Policy::Master'"
  end
end
