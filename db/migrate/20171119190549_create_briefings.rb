class CreateBriefings < ActiveRecord::Migration[5.1]
  def change
    create_table :briefings do |t|
      t.string :doc_id
      t.string :file_id
      t.string :temp_team

      t.timestamps
    end
  end
end
