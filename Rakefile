# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

require 'bundler'
Bundler::GemHelper.install_tasks

BcmsMobile::Application.load_tasks

# Cucumber tasks will run twice.
# This issue might be the problem, but the suggested fix didn't work: http://andymaleh.blogspot.com/2011/09/cucumber-tests-run-twice-in-rails-3.html until BrowserCMS
#
task :test => ['test:units', 'test:functionals', 'test:integration', 'cucumber']
