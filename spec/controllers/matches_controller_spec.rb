require 'rails_helper'

RSpec.describe MatchesController, type: :controller do

  let(:user) { create(:user) }

  describe '#create' do
    before { sign_in user }

    context "with valid attributes" do
      let(:valid_attributes) { { match: { result: {"foo": "bar"}.to_json } } }

      xit 'should return 200 - OK' do
        post :create, valid_attributes, format: :json
        expect( response ).to have_http_status(:ok)
      end

      xit 'should create a new match' do
        expect{ post :create, valid_attributes, format: :json }.to change{ Match.count }.by(1)
      end

      xit 'should return a new match in the response body' do
        post :create, valid_attributes, format: :json
        expect( JSON.parse(response.body)['data']['id'] ).to eq Match.last.id
        expect( JSON.parse(response.body)['data']['result'] ).to eq Match.last.result
      end

      context "when team with these members does not exist" do

        it 'should create a new team' do

        end
      end

      context "when team with these members already exists" do

        it 'should not create a new team' do

        end
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { { match: { random_attr: {"foo": "bar"}.to_json } } }

      xit 'should return 422 - Unproccessable entity' do
        post :create, invalid_attributes, format: :json
        expect( response ).to have_http_status(:unprocessable_entity)
      end

      xit 'should not create a new match' do
        expect{ post :create, invalid_attributes, format: :json }.to change{ Match.count }.by(0)
      end

      xit 'should return an error message' do
        post :create, invalid_attributes, format: :json
        expect( JSON.parse(response.body)['errors'] ).to eq "Could not create Match"
      end
    end
  end

  describe '#index' do

  end
end