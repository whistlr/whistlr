class CreateUserAuthorStats < ActiveRecord::Migration
  def change
    create_table :user_author_stats do |t|
      t.integer :user_id, null: false
      t.integer :articles, null: false, default: 0
      t.integer :sections, null: false, default: 0
      t.integer :edits, null: false, default: 0
    end

    add_index :user_author_stats, :user_id
  end
end
