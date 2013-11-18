class MainController < ApplicationController
  include Blacklight::Catalog

  def index
    if params[:search_field].nil? || params[:search_field].length==0
      params[:search_field]="all_fields"
    end
    (@response, @document_list) = get_search_results
    @filters = params[:f] || []

    respond_to do |format|
      format.html {
        extra_head_content << view_context.auto_discovery_link_tag(:rss, url_for(params.merge(:format => 'rss')), :title => t('blacklight.search.rss_feed') )
        extra_head_content << view_context.auto_discovery_link_tag(:atom, url_for(params.merge(:format => 'atom')), :title => t('blacklight.search.atom_feed') )
      }
      format.rss  { render :layout => false }
      format.atom { render :layout => false }


      format.json do
        render json: render_search_results_as_json
      end
    end
  end
end
