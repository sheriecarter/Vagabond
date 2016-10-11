class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :city, optional: true

  validates :title, length: { in:1..200 }
  validates :body, length: { minimum: 1 }
end
