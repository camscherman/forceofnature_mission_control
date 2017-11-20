class Event < ApplicationRecord
  belongs_to :user
  has_many :attending, dependent: :destroy
  has_many :attendees, through: :attending, source: :user
  validates :title, :description, :location, presence: :true

  validate :valid_start_date, on: :create
  validate :valid_end_date, on: :create

  def valid_start_date
    if self.start_time < DateTime.now
      errors.add(:start_time, "can't be in the past")
    end
  end

  def valid_end_date
    if self.end_time < start_time
      errors.add(:end_time, "can't be before start_time")
    end
  end

end
