class CreateReportEvidenceJoins < ActiveRecord::Migration
  def change
    create_table :report_evidence_joins do |t|
      t.integer :report_id, null: false
      t.integer :evidence_id, null: false
    end

    add_index :report_evidence_joins, :report_id
    add_index :report_evidence_joins, :evidence_id
  end
end
