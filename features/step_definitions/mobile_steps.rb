Given /^the homepage should exist$/ do
  assert_equal "Home", Page.find_by_path("/").name
end

Given /^a page exists at \/mobile\-page$/ do
  @page = Factory(:published_page, :path=>"/mobile-page")
  content = Factory(:html_block, :content=>"Mobile Content")
  @page.add_content(content)
  @page.publish!
end

When /^a desktop user requests \/mobile\-page$/ do
  visit '/mobile-page'
end

Then /^the page should use the desktop template$/ do
  assert page.has_content? "I am the desktop TEMPLATE"
  assert page.has_content? "Mobile Content"
end

When /^a mobile user requests \/mobile\-page$/ do
  request_as_iphone
  visit '/mobile-page'
end

Then /^the page should use the mobile template$/ do
  assert page.has_content? "I am a stripped down MOBILE template."
  assert page.has_content? "Mobile Content"
end

Then /^show me the page$/ do
  save_and_open_page
end