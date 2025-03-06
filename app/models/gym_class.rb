class GymClass < ApplicationRecord
    has_many :appointments, dependent: :destroy
  
    validates :name, presence: true
    validates :description, presence: true
    validates :instructor, presence: true
    validates :schedule, presence: true
  end
  