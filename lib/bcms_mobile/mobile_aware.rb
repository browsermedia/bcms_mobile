module BcmsMobile

  module MobileHelpers

    def full_site_url
      url_for(:host=>SITE_DOMAIN, :prefer_full_site=>true)
    end

    def mobile_site_url
      url_for(:host=>SITE_DOMAIN, :prefer_mobile_site=>true)
    end


  end

  module MobileAware

    def w(m)
      logger.warn m
    end

    def banner(m)
      w "*" * 20
      w m
    end

    # Returns the directory where BrowserCMS should write out it's Page cache files for the mobile version of the site.
    # (Optionally) It can be configured in environment files via:
    #   config.bcms_mobile_cache_directory = File.join(Rails.root, 'some', 'mobile_dir')
    def mobile_cache_directory
      configured_dir = Rails.application.config.bcms_mobile_cache_directory
      configured_dir ? configured_dir : default_mobile_cache_directory
    end

    # Returns the directory where BrowserCMS should write out it's Page cache files for the full version of the site.
    # This should be exactly the same as where a typical CMS project stores it's files.
    # (Optionally) It can be configured in environment files via:
    #   config.browsercms_cache_directory = File.join(Rails.root, 'some', 'dir')
    def cms_cache_directory
      configured_dir = Rails.application.config.browsercms_cache_directory
      configured_dir ? configured_dir : default_browsercms_cache_directory
    end

    # Looks for a mobile template if the request is mobile, falling back to the html template if it can't be found.
    def determine_page_template
      layout = @page.layout
      layout_name = @page.template_file_name

      if respond_as_mobile?
        w "Does html layout exist?:#{template_exists?(layout_name, "layouts/templates")}"
        mobile_exists = template_exists?(layout_name, "layouts/mobile")
        w "Does mobile layout exist?:#{mobile_exists}"
        layout = "mobile/#{layout_name}" if mobile_exists
      end
      w "layout = #{layout}"
      layout
    end

    private
    def default_browsercms_cache_directory
      File.join(Rails.root, 'public', 'cache')
    end

    def default_mobile_cache_directory
      File.join(Rails.root, 'public', 'mobile_cache')
    end
  end

end