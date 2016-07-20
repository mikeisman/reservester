class Restaurant < ActiveRecord::Base
  belongs_to :owner
  has_many :reservations

  validates :name, presence: true
  validates :address, presence: true, format: { with: /[0-9]+ .*/ }
  validates :owner_id, presence: true
end
