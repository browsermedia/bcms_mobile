Given /^the homepage should exist$/ do
  assert_equal "Home", Page.find_by_path("/").name
end

Given /^a page exists at ([\/|\w|-]+)$/ do |path|
  @page = Factory(:published_page, :path=>path)
  content = Factory(:html_block, :content=>"Mobile Content")
  @page.add_content(content)
  @page.publish!
end

Given /^a page exists at (.+) with a desktop only template$/ do |path|
  @page = Factory(:published_page, :path=>path, :template_file_name=>"desktop-only.html.erb")
  content = Factory(:html_block, :content=>"Mobile Content")
  @page.add_content(content)
  @page.publish!
end

When /^a desktop user requests (.+)$/ do |path|
  visit path
end

Given /^a user is browsing the mobile site$/ do
  @site_domain = "http://m.example.com"
end

Given /^a user is browsing the desktop site$/ do
  @site_domain = "http://www.example.com"
end

When /^they request (.+)$/ do |path|
  domain = @site_domain ? @site_domain : ""
  visit "#{domain}#{path}"
end

Then /^they should see the desktop content$/ do
  assert page.has_content? "I am the desktop TEMPLATE"
  assert page.has_content? "Mobile Content"
end

Then /^they should see the mobile template$/ do
  assert page.has_content? "I am a stripped down MOBILE template."
  assert page.has_content? "Mobile Content"
end

Then /^show me the page$/ do
  save_and_open_page
end

When /^they are using an iPhone$/ do
  request_as_iphone
end

Given /^a cms editor is logged in$/ do
  visit '/cms/login'
  fill_in 'login', :with=>'cmsadmin'
  fill_in 'password', :with=>'cmsadmin'
  click_button 'LOGIN'
end