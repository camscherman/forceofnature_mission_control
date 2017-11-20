class RemoveDocIdFileIdAndTempTeamFromBriefings < ActiveRecord::Migration[5.1]
  def change
    remove_column :briefings, :doc_id, :string
    remove_column :briefings, :file_id, :string
    remove_column :briefings, :temp_team, :string
  end
end
