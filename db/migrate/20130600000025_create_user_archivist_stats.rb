class CreateUserArchivistStats < ActiveRecord::Migration
  def change
    create_table :user_archivist_stats do |t|
      t.integer :user_id, null: false
      t.integer :submitted_records, null: false, default: 0
      t.integer :accepted_records, null: false, default: 0
      t.integer :rejected_records, null: false, default: 0
      t.integer :submitted_edits, null: false, default: 0
      t.integer :accepted_edits, null: false, default: 0
      t.integer :rejected_edits, null: false, default: 0
      t.integer :details_provided, null: false, default: 0
    end

    add_index :user_archivist_stats, :user_id
  end
end
