class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :followable_id
      t.string :followable_type
      t.integer :user_id
    end

    add_index :follows, :user_id
    add_index :follows, [:followable_id, :followable_type]
  end
end
