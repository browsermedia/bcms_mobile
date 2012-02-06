require "bcms_support/cucumber"
require "bcms_support/factories"

# Load the BrowserCMS Seed data once at the begin of the tests.
# Assumes the transaction strategy is used and the seed data will be retained between tests.
DatabaseCleaner.clean_with(:truncation)
silence_stream(STDOUT) do
  require File.join(File.dirname(__FILE__), '../../db/seeds.rb')
end

