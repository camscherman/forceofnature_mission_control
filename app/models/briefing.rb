class Briefing < ApplicationRecord

  has_many :briefing_file
  has_many :file_path, through: :briefing_file, source: :file_path
end
