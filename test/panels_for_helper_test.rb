require "test_helper"

class PanelsFor::Rails::PanelsForHelperTest < ActionView::TestCase

  test "#panel draws a collapable panel with header" do
    expected = "<div class=\"panel\"></div>"
    assert_panel_for(expected, object) do |b|
      b.panel :graphs, icon: "bar-chart" do
        "Bar Chart"
      end
    end
  end

  private

  def object
    Object.new
  end

  def assert_panel_for(expected, *args, &block)
    assert_dom_equal expected, panels_for(*args, &block)
  end

end
