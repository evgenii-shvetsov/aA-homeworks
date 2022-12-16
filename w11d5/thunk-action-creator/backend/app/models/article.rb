class Article < ApplicationRecord
  validates :title, :image_url, :body, presence: true
end
