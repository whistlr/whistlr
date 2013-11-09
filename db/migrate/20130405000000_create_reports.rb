class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :type, null: false

      t.integer :master_id

      t.boolean :approved, null: false, default: false
      t.boolean :declined, null: false, default: false
      t.boolean :pending, null: false, default: true

      t.string :summary
      t.text :description

      t.integer :responses_sum, null: false, default: 0
      t.integer :responses_approve, null: false, default: 0
      t.integer :responses_disapprove, null: false, default: 0
      t.integer :controversy, null: false, default: 0
      t.integer :disinterest, null: false, default: 0

    end

    add_index :reports, :type
    add_index :reports, :approved
    add_index :reports, :pending
    add_index :reports, :responses_sum
    add_index :reports, :responses_disapprove
    add_index :reports, :responses_approve
    add_index :reports, :controversy
    add_index :reports, :disinterest
  end
end
