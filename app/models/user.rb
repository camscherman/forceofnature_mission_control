class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events

  has_many :attending, dependent: :destroy
  has_many :attend_events, through: :attending, source: :events

  has_many :using_briefing, dependent: :destroy
  has_many :briefings, through: :using_briefing, source: :briefing    
end
