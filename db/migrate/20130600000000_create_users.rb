class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :active, default: true, null: false
      
      t.text :bio
      t.date :birthday
      t.string :location
      t.string :twitter_name
      t.string :name, null: false
      t.string :website

      t.decimal :whuffie, default: 0, null: false, precision: 6, scale: 4
      t.integer :developer_reputation, null: false, default: 0
      t.integer :designer_reputation, null: false, default: 0
      t.integer :whistlr_reputation, null: false, default: 0
      t.integer :archivist_reputation, null: false, default: 0
      t.integer :marketer_reputation, null: false, default: 0
      t.integer :organizer_reputation, null: false, default: 0
      t.integer :community_reputation, null: false, default: 0
      t.integer :translator_reputation, null: false, default: 0
      t.integer :author_reputation, null: false, default: 0

      t.integer :follow_count, null: false, default: 0

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :active
    add_index :users, :whuffie
    add_index :users, :developer_reputation
    add_index :users, :designer_reputation
    add_index :users, :whistlr_reputation
    add_index :users, :archivist_reputation
    add_index :users, :marketer_reputation
    add_index :users, :organizer_reputation
    add_index :users, :community_reputation
    add_index :users, :translator_reputation
    add_index :users, :author_reputation
    add_index :users, :follow_count
  end
end