require 'rails_helper'

RSpec.describe TeamMatch, type: :model do

  it { should respond_to :team }
  it { should respond_to :match }
end
