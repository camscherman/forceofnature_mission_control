class Event < ApplicationRecord
  belongs_to :user
  has_many :attending, dependent: :destroy
  has_many :attendees, through: :attending, source: :user

end
