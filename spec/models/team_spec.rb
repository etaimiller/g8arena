require 'rails_helper'

RSpec.describe Team, type: :model do

  it { should respond_to :users }
  it { should respond_to :matches }
end
