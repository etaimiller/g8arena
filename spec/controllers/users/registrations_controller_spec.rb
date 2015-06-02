require 'rails_helper'

module Users
  describe RegistrationsController do

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    describe 'create' do
      let!(:user_params) { { email: 'test@example.com', password: 'secret123' } }

      it "should be successful" do
        post :create, user_params, format: :json
        expect(response).to have_http_status(:ok)
      end

      it "should create a User" do
        expect{ post :create, user_params, format: :json }.to change{ User.count }.by(1)
      end
    end
  end
end