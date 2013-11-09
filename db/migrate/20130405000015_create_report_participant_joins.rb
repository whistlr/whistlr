class CreateReportParticipantJoins < ActiveRecord::Migration
  def change
    create_table :report_participant_joins do |t|
      t.integer :report_id, null: false
      t.integer :participant_id, null: false
    end

    add_index :report_participant_joins, :report_id
    add_index :report_participant_joins, :participant_id
  end
end
