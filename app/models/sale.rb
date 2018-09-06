class Sale < ApplicationRecord
  validates :cod, uniqueness: true
  validates :detail, presence: true
  validates :category, inclusion: %w(uno dos tres cuatro cinco)
  validates :value, numericality: true
  validates :discount, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 40 } 
end
