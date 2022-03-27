require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'to be successful' do
      get '/users/#index'
      expect(response.status).to eq 200
    end
    it 'to return users' do
      User.create(first_name: 'Travis', last_name: 'Courtney', email: 'travis@example.com')
      get '/users/#index'
      expect(response.body).to include('travis@example.com')
    end
  end

  describe 'POST /create' do
    it 'to create a new user' do
      user_params = { 
        first_name: 'Travis',
        last_name: 'Courtney',
        email: 'travis@example.com',
        password: ''
       }
      post '/users/#create', params: user_params.to_json, headers: { "Content-Type": 'application/json'}
      expect(response.status).to eq 201
    end
    it 'to raise an error when creating a new user with duplicate email' do
      User.create(email: 'travis@example.com',  first_name: 'Travis', last_name: 'Courtney')
      user_params = {
        first_name: 'Travis',
        last_name: 'Courtney',
        email: 'travis@example.com',
        password: ''
      }

      expect { post '/users/#create', params: user_params.to_json, headers: { "Content-Type": 'application/json' } }.to raise_error( ActiveRecord::RecordInvalid )
    end
  end
end
