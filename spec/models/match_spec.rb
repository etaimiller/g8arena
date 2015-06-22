require 'rails_helper'

RSpec.describe Match, type: :model do

  it { should respond_to :teams }
  it { should respond_to :result }
end
