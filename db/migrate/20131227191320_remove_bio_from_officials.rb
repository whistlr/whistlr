class RemoveBioFromOfficials < ActiveRecord::Migration
  def change
    remove_column :officials, :bio, :text
  end
end
