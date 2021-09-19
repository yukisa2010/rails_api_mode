require 'rails_helper'

RSpec.describe 'Customers API', type: :request do
    describe 'GET /customers' do
        let!(:organization) { create(:organization) }
        let!(:customer) { create(:customer) }
        context '認証済みユーザーの場合' do
            let(:auth_header) { create(:user).create_new_auth_token }
            before { get '/customers', headers: auth_header }

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            it 'returns all customers' do
                expect(json.size).to eq(1)
            end
        end

        context '認証済みでないユーザーの場合' do
            let(:auth_header) { create(:user).create_new_auth_token }
            before { get '/customers', headers: {} }

            it 'returns status code 401' do
                expect(response).to have_http_status(401)
            end
        end

    end
end