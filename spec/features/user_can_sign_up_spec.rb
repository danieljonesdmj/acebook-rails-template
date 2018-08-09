# frozen_string_literal: true

require 'rails_helper'
require 'helpers/users_helper_spec'

RSpec.feature 'Registration', type: :feature do
  scenario 'Can register with correct details and be directed to posts page' do
    visit '/users/sign_up'
    expect(page).to have_content('Username')
    fill_in 'user_username', with: 'test'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'test123'
    fill_in 'user_password_confirmation', with: 'test123'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
  scenario 'Cannot register if passwords don\'t match' do
    visit '/users/sign_up'
    expect(page).to have_content('Username')
    fill_in 'user_username', with: 'test'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'test123'
    fill_in 'user_password_confirmation', with: 'test567'
    click_button 'Sign up'
    expect(page).to have_content('Password confirmation doesn\'t match Password')
  end
  scenario 'Cannot register if email is invalid' do
    visit '/users/sign_up'
    expect(page).to have_content('Username')
    fill_in 'user_username', with: 'test'
    fill_in 'user_email', with: 'test.test.com'
    fill_in 'user_password', with: 'test123'
    fill_in 'user_password_confirmation', with: 'test123'
    click_button 'Sign up'
    expect(page).to have_content("Sign up 1 error prohibited this user from being saved: Email is invalid")
  end
  end
