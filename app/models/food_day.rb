class FoodDay < ApplicationRecord
  belongs_to :food
  belongs_to :day
end
