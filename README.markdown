# Mobile Module for BrowserCMS

## Features (Completed)

* Developers can define a .mobile.erb template for any existing .html.erb template on a project.
* Visitors on mobile device, who request a page with a mobile template will get that mobile template.
* Editors always see the desktop template

Caveats:
* Doesn't work with cached pages.


## Issues
* What happens if I don't create a mobile template for a page.
* If .mobile view exists, but no .mobile template, it renders with no layout. (Does not fall back to .html)
* Not 100% sure why admins ALWAYS see the desktop template (even when viewing as mobile). Probably related to how ContentController stack changes.

## Features (Possible)

1. Developers should be able to specify a .mobile.erb template for any existing CMS site template.
1. On m.domain.com
1. If UserAgent = Mobile, then use mobile template.
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