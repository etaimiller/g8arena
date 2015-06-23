require 'rails_helper'

describe TeamManager do

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  describe '.initialize' do
    context "with valid parameters" do
      let(:valid_attrs) { { team: { users: [user1, user2].to_json } } }

      subject { TeamManager.new(valid_attrs[:team]) }

      it 'should set the user_list attribute' do
        expect( subject.user_list ).to eq valid_attrs[:team]
      end
    end

    context "with invalid parameters" do

    end
  end

  describe '.assemble' do

    context "with valid parameters" do
      let(:valid_attrs) { { team: { users: [user1, user2].to_json } } }

      subject { TeamManager.new(valid_attrs[:team]) }

      it 'should return a Team object class' do
        expect( subject.assemble.class ).to eq Team
      end

      it 'should return a team with the correct users' do
        team = subject.assemble
        expect( team.users ).to eq [user1, user2]
      end
    end

    context "with invalid parameters" do
      let(:invalid_attrs) { { team: { users: [user1, user2, "bad" ].to_json } } }

      subject { TeamManager.new(invalid_attrs[:team]) }

      it "should return a team" do
        expect( subject.assemble ).to be nil
      end
    end
  end

  describe '.convert_to_users_collection' do

    context "with valid parameters" do
      let(:valid_attrs) { { team: { users: [user1, user2].to_json } } }

      subject { TeamManager.new(valid_attrs[:team]) }

      it 'should return an array of users' do
        expect( subject.convert_to_users_collection ).to eq [user1,user2]
      end
    end

    context "with invalid parameters" do
      let(:invalid_attrs) { { team: { users: [user1, user2, "bad" ].to_json } } }

      subject { TeamManager.new(invalid_attrs[:team]) }

      it 'should return nil' do
        expect( subject.convert_to_users_collection ).to eq nil
      end
    end
  end

end