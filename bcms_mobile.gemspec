Gem::Specification.new do |spec|
  spec.name = "bcms_mobile"
  spec.rubyforge_project = spec.name
  spec.version = "1.0.0"
  spec.summary = "A Bcms Mobile Module for BrowserCMS"
  spec.author = "BrowserMedia" 
  spec.email = "github@browsermedia.com" 
  spec.homepage = "http://www.github.com/browsermedia/bcms_mobile"
  spec.files += Dir["app/**/*"]
  spec.files -= Dir["app/views/layouts/templates/default.html.erb"]
  spec.files += Dir["db/migrate/*.rb"]
  spec.files -= Dir["db/migrate/*_browsercms_*.rb"]
  spec.files += Dir["lib/**/*"]
  spec.files -= Dir["lib/tasks/build_gem.rake"]
  spec.files += Dir["public/bcms/mobile/**/*"]
  spec.files += Dir["LICENSE.txt"]
  spec.files += Dir["GPL.txt"]
  spec.files += Dir["Gemfile"]
  spec.files += Dir["Copyright.txt"]
  spec.has_rdoc = true
  spec.extra_rdoc_files = ["README"]

  spec.add_dependency('mobylette', "~> 1.6.0")
  spec.add_dependency('browsercms', "~> 3.3.3")

end