class CreatePollAttributes < ActiveRecord::Migration
  def change
    create_table :poll_attributes do |t|
      t.integer :user_id

      t.integer :pollable_id, null: false
      t.string :pollable_type, null: false

      t.boolean :approved, null: false, default: false
      t.boolean :declined, null: false, default: false
      t.boolean :pending, null: false, default: true

      t.integer :votes_yea, default: 0, null: false
      t.integer :votes_nay, default: 0, null: false
      t.integer :votes_sum, default: 0, null: false

      t.text :notes

      t.integer :comments_count, null: false, default: 0
      
    end
    add_index :poll_attributes, [:pollable_id, :pollable_type]
  end
end