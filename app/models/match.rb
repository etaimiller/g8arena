class Match < ActiveRecord::Base
  has_many :team_matches, dependent: :destroy
  has_many :teams, through: :team_matches

  validates :result, presence: true
end
