class Party < ApplicationRecord
  validates :name, :location, presence: true

  has_many :invitations, dependent: :destroy
  has_many :gifts, dependent: :destroy
  has_many :guests, through: :invitations, source: :guest
end
