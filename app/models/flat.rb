class Flat < ApplicationRecord
  validates :name, :url, :address, :description, :price_per_night, :number_of_guests, presence: true
  validates :price_per_night, numericality: { less_than: 200 }
  validates :number_of_guests, numericality: { less_than: 5 }
end
