class CreateReportResponses < ActiveRecord::Migration
  def change
    create_table :report_responses do |t|
      t.integer :user_id, null: false
      t.integer :report_id, null: false
      t.integer :value, null: false, default: 0

      t.datetime :created_at
    end

    add_index :report_responses, :user_id
    add_index :report_responses, :report_id
  end
end
