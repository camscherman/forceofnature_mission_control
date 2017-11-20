class Event < ApplicationRecord
  belongs_to :user
  has_many :attending, dependent: :destroy
  has_many :attendees, through: :attending, source: :user
  validates :title, :description, :location, presence: :true

end
