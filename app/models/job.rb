class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, persence: true
  validates :wage_lower_bound, persence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
end
