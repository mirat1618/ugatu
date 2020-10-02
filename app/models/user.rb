class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:guest, :analyst, :admin]

  before_create :assign_auth_token

  private
    def assign_auth_token
      self.auth_token = Devise.friendly_token
    end
end
