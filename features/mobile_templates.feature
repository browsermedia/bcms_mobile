Feature:
  Visitors on mobile devices should see mobile templates when they visit pages.

  Background:
    Given a page exists at /mobile-page

  Scenario: Desktop Visitor sees Desktop template
    Given a user is browsing the desktop site
    When they request /mobile-page
    Then they should see the desktop content

  Scenario: Browsing mobile site pages
    Given a user is browsing the mobile site
    When they request /mobile-page
    Then they should see the mobile template

  Scenario: Browsing the desktop site with a mobile browser
    Given a user is browsing the desktop site
    And they are using an iPhone
    When they request /mobile-page
    Then they should see the desktop content

  Scenario: Browsing a page on mobile site without a mobile template
    Given a page exists at /not-mobile with a desktop only template
    And a user is browsing the mobile site
    When they request /not-mobile
    Then they should see the desktop content

  Scenario: Editors can see mobile version of page
    Given a cms editor is logged in
    When they request /mobile-page
    Then they should see the desktop content
    When they request /mobile-page?template=mobile
    Then they should see the mobile template

  Scenario: Guests can't request mobile versions of page
    Given a user is browsing the desktop site
    When they request /mobile-page?template=mobile
    Then they should see the desktop content

