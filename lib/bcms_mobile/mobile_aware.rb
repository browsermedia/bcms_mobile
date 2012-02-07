module BcmsMobile
  module MobileAware

    def w(m)
      logger.warn m
    end

    def banner(m)
      w "*" * 20
      w m
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
  end


end