class Team < ActiveRecord::Base
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams

  has_many :team_matches, dependent: :destroy
  has_many :matches, through: :team_matches
end
