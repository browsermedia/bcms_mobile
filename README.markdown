# Mobile Module for BrowserCMS

## Features (Completed)

* Developers can define a mobile template for any existing .html.erb template on a project. These template are named the same as the existing templates, but are placed in a separate layouts/mobile directory.
* Preview as Mobile: Editors should be able to preview the mobile templates. Once in 'mobile' mode, all pages should be viewed as mobile until they disable it.
* Editors always see the desktop template, unless they add a ?template=mobile parameter to the URL of the page they are viewing.
* Mobile assumes a m. subdomain will exist. It will return the mobile template for all requests to pages on that domain.
* If page uses a template which has no mobile counterpart, it will display using its normal template.
* Agent Redirection: Users on mobile devices can be automatically redirected to the m. site. (Handled via Apache User Agent detection.)
* Mobile Site Opt Out: Users on mobile device can opt to be redirected to the desktop site if they want. (Handled via a cookie)
* Mobile caching: The mobile and full sites have their own separate page cache, mean both can be served quickly by Apache.



## Issues
* Can developers toggle between m. and www. locally without setting up POW?
* Is two weeks long enough for the full site preference?
* Can they test mobile remotely?


## Things to improve

* The Apache conf file has way too much logic in it. Specifically, the device types and matching rules really can't be tested, at all. We also have to have a 3rd virtual host for the m. site which isn't so hot.

## Installation

* Add Full and Mobile links to templates. Sometimes mobile users really want to see the full site, so make sure they are conveniently placed on both mobile and full templates.
* Configure the mobile and full site cache locations

# Resources

Mobilette - https://github.com/tscolari/mobylette
Using m.subdomains - http://erniemiller.org/2011/01/05/mobile-devices-and-rails-maintaining-your-sanity/
Presentation on Rails for Subdomains - http://www.slideshare.net/alberto.perdomo/rails-for-mobile-devices-conferencia-rails-2011-8613648
Apache Mobile Filters - http://webdirect.no/mobile/apache-rewrite-rule-for-iphone-users/
RailsCast - http://railscasts.com/episodes/199-mobile-devices?view=comments

http://ryanbigg.com/2009/04/how-rails-works-2-mime-types-respond_to/
http://blog.bigbinary.com/2010/11/23/mime-type-resolution-in-rails.html
Verify if views exist - http://stackoverflow.com/questions/2853355/check-if-a-layout-exists-in-rails

Excellent Cookie Setting solution for Apache: http://www.phillipadsmith.com/2011/11/note-to-self-a-simple-way-to-accomplish-mobile-site-redirection-using-mod-rewrite.html
Modern Mobile Detection - http://ohryan.ca/blog/2011/01/21/modern-mobile-redirect-using-htaccess/
Using Apache for User Agent/Detection - http://mobiledrupal.com/simple-apache-configuration-file-mobile-device-detection
http://ohryan.ca/blog/2011/01/21/modern-mobile-redirect-using-htaccess/

## Development

To really test this, you will need to setup POW or some other solution that can handle the multiple subdomains, i.e.

m.bcms-mobile.dev
www.bcms-mobile.dev
cms.bcms-mobile.dev

## Alternative Plan - Use Passenger/Apache

To get configuration right, need Apache/Passenger so you can fool around with Apache specific rewrite rules. See these instructions for setting up Passenger on OSX.

- http://www.robbyonrails.com/articles/2009/02/11/switch-to-passenger-mod_rails-in-development-on-osx-in-less-than-7-minutes-or-your-money-back
- http://www.fngtps.com/2008/using-passenger-on-osx-for-rails-development/