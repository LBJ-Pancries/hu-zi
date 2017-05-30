class Product < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  mount_uploader :image, ImageUploader
  acts_as_list
  belongs_to :category
end
