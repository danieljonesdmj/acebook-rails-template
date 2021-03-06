# frozen_string_literal: true

require 'rails_helper'
require 'users_helper.rb'
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
