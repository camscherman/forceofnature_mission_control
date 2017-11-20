class CreateBriefingFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :briefing_files do |t|
      t.references :file_path, foreign_key: true
      t.references :briefing, foreign_key: true

      t.timestamps
    end
  end
end
