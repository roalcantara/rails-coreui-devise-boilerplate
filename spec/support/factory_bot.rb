# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.start
    FactoryBot.lint
  ensure
    DatabaseCleaner.clean
  end
end
