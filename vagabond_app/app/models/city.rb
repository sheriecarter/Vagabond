class City < ApplicationRecord
  has_many :posts, dependent: :destroy
  ratyrate_rateable "city"
end
