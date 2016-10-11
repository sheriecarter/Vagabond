class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
  validates :email, uniqueness:true
  ratyrate_rater
end
