# Mobile Module for BrowserCMS

A 'Mobile First' module that allows any BrowserCMS page to be served in a mobile optimized format for specific mobile devices. Pages can have mobile optimized templates that can reduce their download weight and layout for reduced screen/bandwidth platforms.

## Features

* Developers can define a mobile template for any existing .html.erb template on a project. These template are named the same as the existing templates, but are placed in a separate layouts/mobile directory.
* View as Mobile: Editors should be able to preview the mobile templates. Once in 'mobile' mode, all pages should be viewed as mobile until they disable it.
* Mobile assumes a m. subdomain will exist. It will return the mobile template for all requests to pages on that domain.
* Fallback Templates: If page uses a template which has no mobile counterpart, it will display using its normal template.
* Agent Redirection: Users on mobile devices can be automatically redirected to the m. site. (Handled via Apache User Agent detection.)
* Mobile Site Opt Out: Users on mobile device can opt to be redirected to the desktop site if they want. (Handled via a cookie)
* Mobile caching: The mobile and full sites have their own separate page cache, mean both can be served quickly by Apache.

## Installation

To install bcms_mobile, run the following commands in your browsercms project:

```
$ gem install bcms_mobile
$ rails g cms:install bcms_mobile
```

This will add a new directory to the project, `app/views/layouts/mobile`. Delete the following line from your config/production.rb file:

```
config.action_controller.page_cache_directory = File.join(Rails.root, 'public', 'cache')
```

### Configuring the Cache Directories

Since this module requires a separate top level domain in production (m.), it needs a separate page cache from the 'full' site version. By default, these will be:

public/cache -> Full site cache
public/mobile_cache -> Mobile Cache

To configure these directories, you can specify new locations in the production.rb via:

```
config.bcms_mobile_cache_directory = File.join(Rails.root, 'public', 'cache' 'mobile')
config.browsercms_cache_directory = File.join(Rails.root, 'public', 'cache', 'full')
```

However, the defaults will be used even if you don't specify the cache directories.

## Making a Mobile Template

To make a mobile template, you can then copy any page template from your `app/views/layouts/templates` into the mobile directory. The file name should be the same. Make any necessary edits to 'mobilize' it (i.e. remove sidebars, image, etc). When you view a page in the CMS, you can toggle between the mobile and desktop templates.

### Add Full/Mobile Site links

Because the module will automatically redirect mobile users to the mobile site, they may want to visit the full site. So make sure they are conveniently placed on both mobile and full templates. You can do this with the following helpers:

```
<%= link_to "See the Full Site", full_site_url %>
<%= link_to "See the Mobile Site", mobile_site_url %>
```

## Development

### Things to improve

* The Apache conf file has way too much logic in it. Specifically, the device types and matching rules really can't be tested, at all. We also have to have a 3rd virtual host for the m. site which isn't so hot.

### Resources

* Mobilette - https://github.com/tscolari/mobylette
* Using m.subdomains - http://erniemiller.org/2011/01/05/mobile-devices-and-rails-maintaining-your-sanity/
* Presentation on Rails for Subdomains - http://www.slideshare.net/alberto.perdomo/rails-for-mobile-devices-conferencia-rails-2011-8613648
* Apache Mobile Filters - http://webdirect.no/mobile/apache-rewrite-rule-for-iphone-users/
* RailsCast - http://railscasts.com/episodes/199-mobile-devices?view=comments
* http://ryanbigg.com/2009/04/how-rails-works-2-mime-types-respond_to/
* http://blog.bigbinary.com/2010/11/23/mime-type-resolution-in-rails.html
* Verify if views exist - http://stackoverflow.com/questions/2853355/check-if-a-layout-exists-in-rails
* Excellent Cookie Setting solution for Apache: http://www.phillipadsmith.com/2011/11/note-to-self-a-simple-way-to-accomplish-mobile-site-redirection-using-mod-rewrite.html
* Modern Mobile Detection - http://ohryan.ca/blog/2011/01/21/modern-mobile-redirect-using-htaccess/
* Using Apache for User Agent/Detection - *http://mobiledrupal.com/simple-apache-configuration-file-mobile-device-detection
* http://ohryan.ca/blog/2011/01/21/modern-mobile-redirect-using-htaccess/

### Getting setup

Working on the bcms_mobile and getting accurate testing requires subdomains enabled locally. If you [set up POW](http://pow.cx/), you can use the basic subdomains.

Steps:

```
$ gem install powder
$ cd bcms_mobile
$ powder link bcms-mobile
```

This will make the following subdomains available for testing.

m.bcms-mobile.dev
www.bcms-mobile.dev
cms.bcms-mobile.dev

## Testing Agent Redirection with Passenger/Apache

Using POW will not enable Agent Redirection, since that is configured via Apache. To adequately test this, you will need to enable Apache/Passenger and configure the virtual hosts as [documented here](https://github.com/browsermedia/bcms_mobile/wiki/Configuring-Apache). On OSX, you can can create a new file called /private/etc/apache2/other/bcms_mobile.conf . This [page here](https://github.com/browsermedia/bcms_mobile/wiki/Developing-bcms_mobile) has a sample configuration file

To get configuration right, need Apache/Passenger so you can fool around with Apache specific rewrite rules. See these instructions for setting up Passenger on OSX.

- http://www.robbyonrails.com/articles/2009/02/11/switch-to-passenger-mod_rails-in-development-on-osx-in-less-than-7-minutes-or-your-money-back
- http://www.fngtps.com/2008/using-passenger-on-osx-for-rails-development/

