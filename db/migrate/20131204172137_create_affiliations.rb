class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.string :type, null: false

      t.integer :master_id

      t.boolean :approved, null: false, default: false
      t.boolean :declined, null: false, default: false
      t.boolean :pending, null: false, default: true

      t.integer :organization_id
      t.integer :official_id

      t.string :start_date
      t.string :end_date
      t.string :title
      t.integer :amount
      t.float :shares, :precision => 5, :scale => 2
    end
    add_index :affiliations, :type
    add_index :affiliations, :approved
    add_index :affiliations, :organization_id
    add_index :affiliations, :official_id
  end
end
