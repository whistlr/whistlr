class CreateUserMarketerStats < ActiveRecord::Migration
  def change
    create_table :user_marketer_stats do |t|
      t.integer :user_id, null: false

      t.integer :facebook_shares, null: false, default: 0
      t.integer :google_plus_shares, null: false, default: 0
      t.integer :tweets, null: false, default: 0
      t.integer :click_throughs, null: false, default: 0
    end

    add_index :user_marketer_stats, :user_id
  end
end
