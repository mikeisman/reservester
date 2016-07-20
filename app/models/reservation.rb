class Reservation < ActiveRecord::Base
  belongs_to :restaurant

  validates :restaurant_id, presence: true
  validates :name, presence: true
  validates :reservation_at, presence: true

  validate :reservation_time_must_be_in_the_future


  private
  def reservation_time_must_be_in_the_future
    if reservation_at.present? && reservation_at < Time.now
      errors.add(:reservation_at, "can't be in the past")
    end
  end
end
