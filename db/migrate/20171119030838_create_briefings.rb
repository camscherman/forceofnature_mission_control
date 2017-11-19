class CreateBriefings < ActiveRecord::Migration[5.1]
  def change
    create_table :briefings do |t|
      t.string :filename

      t.timestamps
    end
  end
end
