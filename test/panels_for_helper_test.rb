require "test_helper"

class PanelsFor::Rails::PanelsForHelperTest < ActionView::TestCase

  test "#panel draws a panel with content" do
    expected = "<div class=\"panel panel-default\"><div class=\"panel-heading\"><h4 class=\"panel-title\">Graphs</h4></div><div class=\"panel-body\">Content</div></div>"
    assert_panel_for(expected, object) do |b|
      b.panel(:graphs) { "Content" }
    end
  end

  test "#panel options[:icon] draws panel with icon prefixed title" do
    expected = "<div class=\"panel panel-default\"><div class=\"panel-heading\"><h4 class=\"panel-title\"><i class=\"fa fa-line-chart\"></i> Graphs</h4></div><div class=\"panel-body\">Content</div></div>"
    assert_panel_for(expected, object) do |b|
      b.panel(:graphs, icon: "line-chart") { "Content" }
    end
  end

  test "#panel options[:collapse] generates a collapsable panel" do
    expected = "<div class=\"panel-group\" id=\"graphs_accordian\" role=\"tablist\" aria-multiselectable=\"true\"><div class=\"panel panel-default\"><div class=\"panel-heading\" role=\"tab\" id=\"heading_graphs\"><h4 class=\"panel-title\"><a role=\"button\" data-toggle=\"collapse\" data-parent=\"#graphs_accordian\" aria-expanded=\"false\" aria-controls=\"collapse_graphs\" href=\"#collapse_graphs\">Graphs</a></h4></div><div id=\"collapse_graphs\" class=\"panel-collapse collapse in\" role=\"tabpanel\" aria-labelledby=\"heading_graphs\"><div class=\"panel-body\">Content</div></div></div></div>"
    assert_panel_for(expected, object) do |b|
      b.panel(:graphs, collapse: true) { "Content" }
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
