class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :eventable_id
      t.string :eventable_type
      t.integer :timelineable_id
      t.string :timelineable_type

      t.datetime :created_at
    end

    add_index :events, [:timelineable_id, :timelineable_type]
  end
end
