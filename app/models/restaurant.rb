class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :stars

  validates :name, presence: true
  validates :address, presence: true, format: { with: /[0-9]+ .*/ }
  validates :user_id, presence: true
end
