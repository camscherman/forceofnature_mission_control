class Briefing < ApplicationRecord

  has_many :briefing_file
  has_many :file_path, through: :briefing_file, source: :file_path

  has_many :using_briefing, dependent: :destroy
  has_many :allowed_users, through: :using_briefing, source: :user
end
