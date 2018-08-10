# frozen_string_literal: true

require 'rails_helper'
require 'helpers/users_helper_spec'

RSpec.feature 'Comment', type: :feature do
  scenario 'Can submit comments and view them' do
    sign_up_new_user
    visit '/posts'
    authorised_user_submit_a_post
    fill_in 'comment[message]', with: 'This is a comment'
    click_button 'Create Comment'
    expect(page).to have_css('p', text: 'This is a comment')
  end
  scenario 'Can see username on comments' do
    sign_up_new_user
    visit '/posts'
    authorised_user_submit_a_post
    fill_in 'comment[message]', with: 'This is a comment'
    click_button 'Create Comment'
    expect(page).to have_content 'test posted less than a minute ago'
  end
end
