require 'rails_helper'

RSpec.describe 'Customers API', type: :request do
    describe 'GET /customers' do
        let!(:customer) { create(:customer) }
        context '認証済みユーザーの場合' do
            let(:auth_header) { create(:user).create_new_auth_token }
            it 'returns status code 200' do
                get '/customers', headers: auth_header
                expect(response).to have_http_status(200)
            end
        end
    end
end