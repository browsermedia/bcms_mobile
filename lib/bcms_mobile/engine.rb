require 'browsercms'
require 'mobylette'
require 'bcms_mobile/mobile_aware'

module BcmsMobile
  class Engine < Rails::Engine
    include Cms::Module

    config.to_prepare do
      Cms::ContentController.class_eval do
        include BcmsMobile::MobileAware

        respond_to_mobile_requests

        before_filter :print_user_agent

        def print_user_agent
          logger.warn "*" * 20
          logger.warn "Is mobile request." if respond_as_mobile?
          logger.warn "User Agent: #{request.user_agent}"
        end

        def handle_mobile
          w "respond_as_mobile? '#{respond_as_mobile?}'"
          w "Before: #{request.formats}"
          super
          w "After Formats? '#{request.formats}'"
          @handled_mobile = true
        end



        private

        def render_page
          handle_mobile && print_user_agent unless handle_mobile_called?

          w "**** Override"
          w "Request Formats = #{request.formats}"
          if respond_as_mobile?
            w "Is mobile request"
          else
            w "Not Mobile"
          end

          w "Mime::Type #{Mime::Type.lookup_by_extension(request.parameters[:format]).to_yaml}"
          @_page_route.execute(self) if @_page_route
          prepare_connectables_for_render

          layout = @page.layout
          w "layout = #{layout}"

          render :layout => layout, :action => 'show'
        end

        # Because of how BrowserCMS's Content Controller's filter chain works,
        # handle_mobile will not be called when users are logged in. So we need explicitly call it before rendering the page
        def handle_mobile_called?
          @handled_mobile == true
        end
      end
    end


  end
end