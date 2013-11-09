class CreateUserDeveloperStats < ActiveRecord::Migration
  def change
    create_table :user_developer_stats do |t|
      t.integer :user_id, null: false
      t.integer :ruby_lines, null: false, default: 0
      t.integer :javascript_lines, null: false, default: 0
      t.integer :html_lines, null: false, default: 0
      t.integer :total_lines, null: false, default: 0
    end

    add_index :user_developer_stats, :user_id
  end
end
