class Recipe < ApplicationRecord
  has_many: bookmarks, dependent: :destroy
  has_many: categories, through: :bookmarks

  validates :name,  presence: true, uniqueness: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :rating, presence: true, numericality: { in: 0..5 }
end
