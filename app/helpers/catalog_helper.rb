module CatalogHelper
  include Blacklight::CatalogHelperBehavior
  #生成导出所有结果的链接
  def render_export_link
    url = request.url.gsub('?','catalog.json?')
  end
end