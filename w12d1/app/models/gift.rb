class Gift < ApplicationRecord
  validates :description, :title, :guest, presence: true

  belongs_to :guest
  belongs_to :party
end
