class Product < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true
   mount_uploader :image, ImageUploader
   acts_as_list
end
