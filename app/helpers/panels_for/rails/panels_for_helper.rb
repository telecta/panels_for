module PanelsFor
  module Rails
    module PanelsForHelper

      def panels_for(object, options = {}, &block)
        capture PanelBuilder.new(object, self), &block
      end

      private

      class PanelBuilder
        include ActionView::Helpers
        include FontAwesome::Rails::IconHelper

        attr_accessor :object, :template, :output_buffer

        def initialize(object, template)
          @object, @template = object, template
        end

        def panel(title, options = {}, &block)
          content_tag(:div, class: "panel panel-default") do
            concat(panel_heading(title, options))
            concat(panel_body(&block))
          end
        end

        def panel_heading(title, options = {})
          content = title.to_s.titleize
          content = fa_icon(options[:icon], text: content) if options.has_key?(:icon)

          content_tag(:div, class: "panel-heading") do
            content_tag(:h3, content, class: "panel-title")
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
