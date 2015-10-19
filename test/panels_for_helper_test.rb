require "test_helper"

class PanelsFor::Rails::PanelsForHelperTest < ActionView::TestCase

  test "#panel draws a panel with content" do
    expected = "<div class=\"panel panel-default\"><div class=\"panel-heading\">Graphs</div><div class=\"panel-body\">Content</div></div>"
    assert_panel_for(expected, object) do |b|
      b.panel(:graphs) { "Content" }
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
