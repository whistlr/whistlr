class CreateUserCommunityStats < ActiveRecord::Migration
  def change
    create_table :user_community_stats do |t|
      t.integer :user_id, null: false
      t.integer :threads_started, null: false, default: 0
      t.integer :comments_made, null: false, default: 0
      t.integer :comment_popularity, null: false, default: 0
      t.integer :posts_made, null: false, default: 0
      t.integer :post_popularity, null: false, default: 0
    end

    add_index :user_community_stats, :user_id
  end
end
