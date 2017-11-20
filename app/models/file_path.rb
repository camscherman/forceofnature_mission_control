class FilePath < ApplicationRecord
  has_many :briefing_files, dependent: :destroy
  has_many :briefings, through: :briefing_file,source: :briefing 
end
