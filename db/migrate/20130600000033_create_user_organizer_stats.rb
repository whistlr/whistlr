class CreateUserOrganizerStats < ActiveRecord::Migration
  def change
    create_table :user_organizer_stats do |t|
      t.integer :user_id, null: false

      t.integer :submitted_projects, null: false, default: 0
      t.integer :accepted_projects, null: false, default: 0
      t.integer :rejected_projects, null: false, default: 0
      t.integer :abandoned_projects, null: false, default: 0
      t.integer :completed_projects, null: false, default: 0
      t.integer :project_participants, null: false, default: 0
      t.integer :project_popularity, null: false, default: 0
    end

    add_index :user_organizer_stats, :user_id
  end
end
