class CreateUsingBriefings < ActiveRecord::Migration[5.1]
  def change
    create_table :using_briefings do |t|
      t.references :user, foreign_key: true
      t.references :briefing, foreign_key: true

      t.timestamps
    end
  end
end
