class Movie < ApplicationRecord
  validates :overview, presence: true
  validates :title, presence: true, uniqueness: true

 
end
