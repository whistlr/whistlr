class CreateUserTranslatorStats < ActiveRecord::Migration
  def change
    create_table :user_translator_stats do |t|
      t.integer :user_id, null: false
      t.integer :submitted_translations, null: false, default: 0
      t.integer :accepted_translations, null: false, default: 0
      t.integer :rejected_translations, null: false, default: 0
      t.integer :submitted_edits, null: false, default: 0
      t.integer :accepted_edits, null: false, default: 0
      t.integer :rejected_edits, null: false, default: 0
    end

    add_index :user_translator_stats, :user_id
  end
end
