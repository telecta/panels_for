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
          content = panel_default(title, options, &block)
          options[:collapse] ? panel_group(title, content) : content
        end

        private

        def panel_default(title, options = {}, &block)
          content_tag(:div, class: "panel panel-default") do
            concat(panel_heading(title, options))
            concat(panel_body(title, options, &block))
          end
        end

        def panel_group(title, content)
          content_tag(
            :div,
            content,
            class:
            "panel-group",
            id: "#{title.to_s.underscore}_accordian",
            role: "tablist",
            aria: {multiselectable: "true"}
          )
        end

        def panel_heading(title, options = {})
          content = title.to_s.titleize
          content = fa_icon(options[:icon], text: content) if options.has_key?(:icon)

          expanded = options[:expanded] ? "true" : "false"

          if options[:collapse]
            content_tag(:div, class: "panel-heading", role: "tab", id: heading_id(title)) do
              id = "collapse_#{title.to_s.underscore}"
              button = link_to(
                content, "##{id}",
                role: "button",
                data: {toggle: "collapse", parent: "##{title.to_s.underscore}_accordian"},
                aria: {expanded: expanded, controls: id}
              )
              content_tag(:h4, button, class: "panel-title")
            end
          else
            content_tag(:div, class: "panel-heading") do
              content_tag(:h4, content, class: "panel-title")
            end
          end
        end

        def panel_body(title, options = {}, &block)
          content = content_tag(:div, template.capture(&block), class: "panel-body")

          if options[:collapse]
            classes = "panel-collapse collapse"
            classes << " in" unless options[:collapsed]
            content_tag(
              :div,
              content,
              id: "collapse_#{title.to_s.underscore}",
              class: classes,
              role: "tabpanel",
              aria: {labelledby: heading_id(title)}
            )
          else
            content
          end
        end

        def heading_id(title)
          "heading_#{title.to_s.underscore}"
        end

      end
    end
  end
end
