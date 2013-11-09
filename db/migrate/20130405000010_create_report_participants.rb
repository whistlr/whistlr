class CreateReportParticipants < ActiveRecord::Migration
  def change
    create_table :report_participants do |t|
      t.integer :involvement, null: false, default: 0
      t.string :summary

      t.integer :reportable_id, null: false
      t.string :reportable_type, null: false

      t.integer :previous_id
    end

    add_index :report_participants, [:reportable_type, :reportable_id], name: :index_report_participants_by_reportable
  end
end
