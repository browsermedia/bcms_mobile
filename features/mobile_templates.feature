Feature:
  Visitors on mobile devices should see mobile templates when they visit pages.

  Background:
    Given a page exists at /mobile-page

  Scenario: Desktop Visitor sees Desktop template
    Given a user is browsing the desktop site
    When they request /mobile-page
    Then they should see the desktop content

  Scenario: Visitors to mobile site get mobile pages
    Given a user is browsing the mobile site
    When they request /mobile-page
    Then they should see the mobile template

  Scenario: Browsing the desktop site with a mobile browser
    Given a user is browsing the desktop site
    And they are using an iPhone
    When they request /mobile-page
    Then they should see the desktop content



