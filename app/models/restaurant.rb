class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :stars
  has_many :starred_by, through: :stars, source: :user

  validates :name, presence: true
  validates :address, presence: true, format: { with: /[0-9]+ .*/ }
  validates :user_id, presence: true
end
