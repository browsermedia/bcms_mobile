module BcmsMobile
  module MobileAware

    def w(m)
      logger.warn m
    end

    def banner(m)
      w "*" * 20
      w m
    end
  end


end