module PanelsFor
  module Rails
    module PanelsForHelper

      def panels_for(object, options = {}, &block)
        capture PanelBuilder.new(object, self), &block
      end

      private

      class PanelBuilder

        def initialize(object, template)
        end

        def panel(*args, &block)
          "<div class=\"panel\"></div>".html_safe
        end

      end

    end
  end
end
