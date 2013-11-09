class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :file, null: false
      t.integer :user_id, null: false

      t.datetime :created_at
    end
  end
end