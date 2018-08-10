# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'

SimpleCov.start do
  add_filter 'application_job'
  add_filter 'application_mailer'
  add_filter 'connection'
  add_filter 'channel'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
