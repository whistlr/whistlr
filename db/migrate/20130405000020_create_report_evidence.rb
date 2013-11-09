class CreateReportEvidence < ActiveRecord::Migration
  def change
    create_table :report_evidence do |t|
      t.string :citation
      t.string :url
      t.integer :upload_id

      t.integer :previous_id
    end
  end
end
