module Spree
  module TestingSupport
    module UrlHelpers
      puts 'in UrlHlpers'
      def spree
        Spree::Core::Engine.routes.url_helpers
      end
    end
  end
end
