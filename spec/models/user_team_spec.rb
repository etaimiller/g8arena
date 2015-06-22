require 'rails_helper'

RSpec.describe UserTeam, type: :model do

  it { should respond_to :user }
  it { should respond_to :team }
end
