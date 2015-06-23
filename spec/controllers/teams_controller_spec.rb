require 'rails_helper'

describe TeamsController do

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  describe '#create' do

    before { sign_in user1 }

    context "with valid parameters" do
      let(:valid_attrs) { { team: { users: [user1, user2].to_json } } }

      it "should return 200 - Ok" do
        post :create, valid_attrs, format: :json
        expect(response).to have_http_status(:ok)
      end

      it "should create a Team" do
        expect{ post :create, valid_attrs, format: :json }.to change{ Team.count }.by(1)
      end

      it "should return the created team" do
        post :create, valid_attrs, format: :json
        expect( JSON.parse(response.body)['data'].to_json ).to eq Team.last.to_json
      end
    end

    context "with invalid parameters" do
      let(:invalid_attrs) { { team: { users: [user1, user2, "bleh"].to_json } } }

      it "should return 200 - Ok" do
        post :create, invalid_attrs, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "should not create a Team" do
        expect{ post :create, invalid_attrs, format: :json }.to change{ Team.count }.by(0)
      end

      it "should return the created team" do
        post :create, invalid_attrs, format: :json
        expect( JSON.parse(response.body)['errors'] ).to eq "Could not create team"
      end
    end
  end

  describe '#index' do
    context "when teams exist" do

    end

    context "when no teams exist" do

    end
  end
end