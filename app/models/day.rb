class Day < ApplicationRecord
  belongs_to :diary
  has_many :food_days
end
