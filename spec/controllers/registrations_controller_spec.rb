# frozen_string_literal: true

require 'rails_helper'
require 'helpers/users_helper_spec'
describe RegistrationsController do
  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end
  describe "GET 'new'" do
    it 'should be successful' do
      get :new
      response.should be_success
    end
  end
end
