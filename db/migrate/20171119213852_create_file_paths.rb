class CreateFilePaths < ActiveRecord::Migration[5.1]
  def change
    create_table :file_paths do |t|
      t.string :path
      t.boolean :is_folder

      t.timestamps
    end
  end
end
