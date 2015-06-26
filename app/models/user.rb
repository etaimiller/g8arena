class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :user_teams, dependent: :destroy
  has_many :teams, through: :user_team

  validates_format_of :email,:with => Devise::email_regexp
end
