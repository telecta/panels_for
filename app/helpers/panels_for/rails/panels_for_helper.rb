module PanelsFor
  module Rails
    module PanelsForHelper

      def panels_for(object, options = {}, &block)
        capture PanelBuilder.new(object, self), &block
      end

      private

      class PanelBuilder
        include ActionView::Helpers

        attr_accessor :object, :template, :output_buffer

        def initialize(object, template)
          @object, @template = object, template
        end

        def panel(title, &block)
          content_tag(:div, class: "panel panel-default") do
            concat(panel_heading(title))
            concat(panel_body(&block))
          end
        end

        def panel_heading(title)
          content_tag(:div, class: "panel-heading") do
            content_tag(:h3, title.to_s.titleize, class: "panel-title")
          end
        end

        def panel_body(&block)
          content_tag(:div, class: "panel-body") do
            template.capture(&block)
          end
        end

      end
    end
  end
end
