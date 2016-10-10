class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :city, optional: true

  validates :title, length: { in:1..200, too_short: "%{count} characters is the minimum allowed", too_long: "%{count} characters is the maximum allowed"}
  validates :body, length: { minimum: 1,
      too_short: "%{count} characters is the minimum allowed"}
end
