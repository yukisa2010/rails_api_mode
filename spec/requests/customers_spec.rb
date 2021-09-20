require 'rails_helper'

RSpec.describe 'Customers API', type: :request do
    context '認証済みユーザーの場合' do
        let!(:organization) { create(:organization) }
        let!(:customer) { create(:customer) }
        let(:auth_header) { create(:user).create_new_auth_token }
        
        describe 'GET /customers' do
            before { get '/customers', headers: auth_header }

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            it 'returns all customers' do
                expect(json.size).to eq(1)
            end
        end

        describe 'POST /customers/' do
            before { post '/customers', params: { name: 'セカンド太郎', organization_id: 1 }, headers: auth_header }

            it 'returns status code 204' do
                expect(response).to have_http_status(204)
            end

            it 'returns all customers' do
                get '/customers', headers: auth_header
                expect(json.size).to eq(2)
            end
        end

        describe 'GET /customers/search' do
            before { post '/customers', params: { name: 'セカンド太郎', organization_id: 1 }, headers: auth_header }
            before { get '/customers/search', params: { name: 'セカンド' }, headers: auth_header }

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            it 'returns searched customer' do
                expect(json.size).to eq(1)
            end
        end

        describe 'GET /organizations' do
            before { get '/organizations', headers: auth_header }

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            it 'returns all organizations' do
                expect(json.size).to eq(1)
            end
        end

        describe 'GET /organizations/:id' do
            before { get '/organizations/1', headers: auth_header }

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            it 'returns all organizations' do
                expect(json["id"]).to eq(1)
            end
        end

        describe 'POST /organizations' do
            before { post '/organizations', params: { name: 'test orgzn'}, headers: auth_header }

            it 'returns status code 200' do
                expect(response).to have_http_status(204)
            end

            it 'returns all organizations' do
                get '/organizations', headers: auth_header
                expect(json.size).to eq(2)
            end
        end

        describe 'PUT /organizations/:id' do
            before { put '/organizations/1', params: { name: '株 D'}, headers: auth_header }

            it 'returns status code 200' do
                expect(response).to have_http_status(204)
            end

            it 'returns all organizations' do
                get '/organizations', headers: auth_header
                expect(json[0]["id"]).to eq(1)
                expect(json[0]["name"]).to eq('株 D')
            end
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