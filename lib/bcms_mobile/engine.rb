require 'browsercms'
require 'mobylette'
require 'bcms_mobile/mobile_aware'

module BcmsMobile
  class Engine < Rails::Engine
    include Cms::Module
    config.to_prepare do

      Cms::ContentController.class_eval do
        include BcmsMobile::MobileAware

        before_filter :print_request_info

        def print_request_info
          w "*" * 20
          w "User Agent: #{request.user_agent}"
          m = "Mobile Request?: "
          if respond_as_mobile?
            m += "Yes"
          else
            m += "No"
          end
          w m

          mime_type = Mime::Type.lookup_by_extension(request.parameters[:format])
          w "Mime::Type: :#{mime_type.symbol}" if mime_type
        end

        # Because of caching, CMS pages should only return mobile content on a separate subdomain.
        def respond_as_mobile?
          w "Checking the subdomain for #{request.domain} is #{request.subdomain}"
          request.subdomain == "m"
        end

        private

        # Overrides core behavior to swap layouts based on whether this is a mobile request or not.
        def render_page

          @_page_route.execute(self) if @_page_route
          prepare_connectables_for_render

          template = determine_page_template

          render :layout => template, :action => 'show'
        end


      end
    end


  end
end