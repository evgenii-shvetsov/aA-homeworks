class Guest < ApplicationRecord
  validates :name, :age, :favorite_color, presence: true

  has_many :gifts, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :parties, through: :invitations, source: :party
end
