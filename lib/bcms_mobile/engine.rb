require 'browsercms'
require 'mobylette'
require 'bcms_mobile/mobile_aware'

module BcmsMobile
  class Engine < Rails::Engine
    include Cms::Module
    config.to_prepare do

      ApplicationHelper.class_eval do
        include BcmsMobile::MobileHelpers
      end

      Cms::ContentController.class_eval do
        include BcmsMobile::MobileAware

        before_filter :print_request_info
        before_filter :configure_cache_directory

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

        def configure_cache_directory
          if respond_as_mobile?
            self.class.page_cache_directory = File.join(Rails.root, 'public', 'mobile_cache')
          else
            self.class.page_cache_directory = File.join(Rails.root, 'public', 'cache')
          end
        end

        # Because of caching, CMS pages should only return mobile content on a separate subdomain.
        # or if a CMS editor wants to see the mobile version of the page.
        def respond_as_mobile?
          w "Checking the subdomain for #{request.domain} is #{request.subdomain}"
          request.subdomain == "m" || (params[:template] =='mobile' && current_user.able_to?(:edit_content))
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