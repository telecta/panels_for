module PanelsFor
  module Rails
    module PanelsForHelper

      def panels_for(object, &block)
        capture PanelBuilder.new(object, self), &block
      end

      private

      class PanelBuilder
        include ActionView::Helpers
        include FontAwesome::Rails::IconHelper

        attr_accessor :object, :template, :output_buffer

        def initialize(object, template)
          @object = object
          @template = template
        end

        def panel(title, options = {}, &block)
          content = panel_default(title, options, &block)
          options[:collapse] ? panel_group(title, content) : content
        end

        private

        def panel_default(title, options = {}, &block)
          content_tag(:div, class: 'panel panel-default') do
            concat(panel_heading(title, options))
            concat(panel_body(title, options, &block))
          end
        end

        def panel_group(title, content)
          content_tag(
            :div,
            content,
            class:
            'panel-group',
            id: "#{title.to_s.underscore}_accordian",
            role: 'tablist',
            aria: { multiselectable: 'true' }
          )
        end

        def panel_heading(title, options = {})
          content = prepare_content(title, options)
          expanded = options[:expanded] ? 'true' : 'false'

          if options[:collapse]
            content = link_to(
              content, "##{collapse_id(title)}",
              role: 'button',
              data: {
                toggle: 'collapse',
                parent: "##{title.to_s.underscore}_accordian"
              },
              aria: { expanded: expanded, controls: collapse_id(title) }
            )
            content_tag(:div, panel_title(content),
                        class: 'panel-heading',
                        role: 'tab',
                        id: heading_id(title))
          else
            content_tag(:div, class: 'panel-heading') do
              panel_title(content)
            end
          end
        end

        def panel_title(content)
          content_tag(:h4, content, class: 'panel-title')
        end

        def panel_body(title, options = {}, &block)
          content = content_tag(:div, class: 'panel-body') do
            template.capture(&block)
          end

          if options[:collapse]
            panel_body_collapse(title, content, options)
          else
            content
          end
        end

        def panel_body_collapse(title, content, options)
          classes = 'panel-collapse collapse'
          classes << ' in' unless options[:collapsed]
          content_tag(
            :div,
            content,
            id: "collapse_#{title.to_s.underscore}",
            class: classes,
            role: 'tabpanel',
            aria: { labelledby: heading_id(title) }
          )
        end

        def prepare_content(title, options)
          content = title.to_s.titleize
          options[:icon] ? fa_icon(options[:icon], text: content) : content
        end

        def heading_id(title)
          "heading_#{title.to_s.underscore}"
        end

        def collapse_id(title)
          "collapse_#{title.to_s.underscore}"
        end
      end
    end
  end
end
