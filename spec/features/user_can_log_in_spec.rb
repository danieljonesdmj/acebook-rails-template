# frozen_string_literal: true

require 'rails_helper'
require 'helpers/users_helper_spec'

RSpec.feature 'Log_in', type: :feature do
  scenario 'Can Login after being signed up with correct email and password' do
    sign_up_new_user
    click_link 'Log out'
    visit 'sign_in'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'hello1'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully. Welcome to Ruffbook,
      test')
  end
end
