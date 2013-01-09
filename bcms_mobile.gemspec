# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bcms_mobile/version"

Gem::Specification.new do |spec|
  spec.name = "bcms_mobile"
  spec.rubyforge_project = spec.name
  spec.version = BcmsMobile::VERSION
  spec.summary = "A Bcms Mobile Module for BrowserCMS"
  spec.author = "BrowserMedia" 
  spec.email = "github@browsermedia.com" 
  spec.homepage = "http://www.github.com/browsermedia/bcms_mobile"
  spec.files += Dir["app/**/*"]
  spec.files -= Dir["app/views/layouts/mobile/*"]
  spec.files -= Dir["app/views/layouts/templates/*"]
  spec.files -= Dir["app/controllers/application_controller.rb"]
  spec.files -= Dir["app/helpers/application_helper.rb"]
  spec.files += Dir["db/migrate/*.rb"]
  spec.files -= Dir["db/migrate/*_browsercms_*.rb"]
  spec.files += Dir["lib/**/*"]
  spec.files -= Dir["lib/tasks/cucumber.rake"]
  spec.files += Dir["public/bcms/mobile/**/*"]
  spec.files += Dir["LICENSE.txt"]
  spec.files += Dir["GPL.txt"]
  spec.files += Dir["Gemfile"]
  spec.files += Dir["Copyright.txt"]
  spec.has_rdoc = true
  spec.extra_rdoc_files = ["README.markdown"]

  spec.add_dependency('mobylette', "~> 1.6.0")
  spec.add_dependency('browsercms', "~> 3.5.4")

end