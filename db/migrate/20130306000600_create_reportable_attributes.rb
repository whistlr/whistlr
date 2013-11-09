class CreateReportableAttributes < ActiveRecord::Migration
  def change
    create_table :reportable_attributes do |t|
      t.integer :reportable_id, null: false
      t.string :reportable_type, null: false

      t.integer :report_count, null: false, default: 0
      t.integer :controversy, null: false, default: 0
      t.integer :favor, null: false, default: 0
    end
    add_index :reportable_attributes, [:reportable_id, :reportable_type], name: "reportable_attributes_reportable_index"
    add_index :reportable_attributes, :report_count
    add_index :reportable_attributes, :controversy
    add_index :reportable_attributes, :favor
  end
end