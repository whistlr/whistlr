class CreateUserDesignerStats < ActiveRecord::Migration
  def change
    create_table :user_designer_stats do |t|
      t.integer :user_id, null: false
      t.integer :submitted_wireframes, null: false, default: 0
      t.integer :accepted_wireframes, null: false, default: 0
      t.integer :rejected_wireframes, null: false, default: 0
      t.integer :submitted_art_assets, null: false, default: 0
      t.integer :accepted_art_assets, null: false, default: 0
      t.integer :rejected_art_assets, null: false, default: 0
    end

    add_index :user_designer_stats, :user_id
  end
end
