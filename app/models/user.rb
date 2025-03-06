class User < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_one :plan, dependent: :destroy
  
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :full_name, presence: true
  end
  