class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :city, optional: true

  validates :title, length: {in:1..200}
  validates :body, length: {minimun: 1}
end
