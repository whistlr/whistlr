class CreateUserWhistlrStats < ActiveRecord::Migration
  def change
    create_table :user_whistlr_stats do |t|
      t.integer :user_id, null: false
      t.integer :submitted_reports, null: false, default: 0
      t.integer :accepted_reports, null: false, default: 0
      t.integer :rejected_reports, null: false, default: 0
      t.integer :submitted_edits, null: false, default: 0
      t.integer :accepted_edits, null: false, default: 0
      t.integer :rejected_edits, null: false, default: 0
      t.integer :details_provided, null: false, default: 0
      t.integer :report_popularity, null: false, default: 0
    end

    add_index :user_whistlr_stats, :user_id
  end
end
