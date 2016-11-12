class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :restaurants
  has_many :stars
  has_many :starred_restaurants, through: :stars, source: :restaurant

  validates :name, presence: true

  def owner?
    return self.role == 'owner'
  end

  def patron?
    return self.role == 'patron'
  end
end
