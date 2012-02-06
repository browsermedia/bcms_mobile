Feature:
  Visitors on mobile devices should see mobile templates when they visit pages.

  Background:

  Scenario: Verify CMS seed data is loaded
    Then the homepage should exist

  Scenario: Desktop Visitor sees Desktop template
    Given a page exists at /mobile-page
    When a desktop user requests /mobile-page
    Then the page should use the desktop template

  Scenario: Mobile visitor sees mobile template
    Given a page exists at /mobile-page
    When a mobile user requests /mobile-page
    Then the page should use the mobile template



