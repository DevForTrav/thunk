require 'rails_helper'

RSpec.describe User, type: :model do

  it 'does not create a new user record without a first_name property' do
    expect{ User.create!(email: 'jsmith@example.com', last_name: 'Smith') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'does not create a new user record without a last_name property' do
    expect{ User.create!(email: 'jsmith@example.com', first_name: 'John') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'does not create a new user record without an email property' do
    expect{ User.create!(first_name: 'John', last_name: 'Smith') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'does not create a record with duplicate emails' do

    user_params = { first_name: 'John', last_name: 'Smith', email: 'jsmith@example.com' }
    User.create!(user_params)
    expect{ User.create!(user_params) }.to raise_error(ActiveRecord::RecordInvalid)
  end



end
