class Product < ApplicationRecord
  validates :name, presence: true
  has_rich_text :description
  has_one_attached :featured_image
end
