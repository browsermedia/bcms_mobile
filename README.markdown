# Mobile Module for BrowserCMS

## Features (Completed)

* Developers can define a mobile template for any existing .html.erb template on a project. These template are named the same as the existing templates, but are placed in a separate layouts/mobile directory.
* Editors always see the desktop template
* Mobile assumes a m. subdomain will exist. It will return the mobile template for all requests to pages on that domain.
* If page uses a template which has no mobile counterpart, it will display using its normal template.

Caveats:
* Doesn't work with cached pages.
* We are no longer relying on Agent Detection. Visitors on mobile device, who request a page that has a mobile template on the main site will see the full content of the page.


## Issues
* Not 100% sure why admins ALWAYS see the desktop template (even when viewing as mobile). Probably related to how ContentController stack changes.

## Features (Possible)

1. Extract cucumber-browsercms project (to reduce required setup)
1. On m.domain.com
1. Allow user to set a preference for mobile vs full site.


Implementation Details

* If there is no .mobile view, it will use the .html layout even if there is a .mobile template. The view itself needs to be defined as .mobile.
* If templatename.mobile exists, it should use that. Otherwise, fall back to .html without complaining.

## m.subdomain
* Rails application would have to handle redirecting to m. based on user preference or User Agent
* Redirection within Rails will not work due to caching (Request would cache HTML and never make it to Rails)
* User preferences could be handled via a permanent cookie.


# Resources

Mobilette - https://github.com/tscolari/mobylette
Using m.subdomains - http://erniemiller.org/2011/01/05/mobile-devices-and-rails-maintaining-your-sanity/
Presentation on Rails for Subdomains - http://www.slideshare.net/alberto.perdomo/rails-for-mobile-devices-conferencia-rails-2011-8613648
Apache Mobile Filters - http://webdirect.no/mobile/apache-rewrite-rule-for-iphone-users/
RailsCast - http://railscasts.com/episodes/199-mobile-devices?view=comments

http://ryanbigg.com/2009/04/how-rails-works-2-mime-types-respond_to/
http://blog.bigbinary.com/2010/11/23/mime-type-resolution-in-rails.html
Verify if views exist - http://stackoverflow.com/questions/2853355/check-if-a-layout-exists-in-rails

## Development

To really test this, you will need to setup POW or some other solution that can handle the multiple subdomains, i.e.

m.bcms-mobile.dev
www.bcms-mobile.dev
cms.bcms-mobile.dev