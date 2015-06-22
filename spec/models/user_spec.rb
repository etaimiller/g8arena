require 'rails_helper'

RSpec.describe User, type: :model do

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:teams) }

end