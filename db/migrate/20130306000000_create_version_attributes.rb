class CreateVersionAttributes < ActiveRecord::Migration
  def change
    create_table :version_attributes do |t|
      t.integer :versionable_id, null: false
      t.string :versionable_type, null: false

      t.integer :previous_id
      t.string :previous_type
      
      t.boolean :initial, null: false, default: false
    end
    add_index :version_attributes, [:versionable_id, :versionable_type]
  end
end