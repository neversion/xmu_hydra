#自定义的非DC对应字段

class CustomDatastream < ActiveFedora::OmDatastream
  set_terminology do |t|
    t.root(:path => "fields")
    t.title :index_as => [:stored_searchable]
    t.subtitle :index_as => [:stored_searchable]
    t.keyword :index_as => [:stored_searchable]
    t.creator :index_as => [:stored_searchable,:facetable]
    t.set_number :index_as => [:displayable]
    t.call_number :index_as => [:stored_searchable]
    t.class1 :index_as => [:stored_searchable]
    t.class2 :index_as => [:stored_searchable]
    t.format :index_as => [:stored_searchable,:facetable]
    t.format_number :index_as => [:displayable]
    t.media_format :index_as => [:stored_searchable,:facetable]
    t.description :index_as => [:stored_searchable]
    t.publisher :index_as => [:stored_searchable,:facetable]
    t.url :index_as => [:displayable]
    t.becount :index_as => [:displayable]
    t.publish_date :index_as => [:stored_sortable], :type=>:date
    t.extra_format :index_as => [:displayable]
    t.app_format :index_as => [:displayable]
    t.cover_pic :index_as => [:displayable]
    t.the_time :index_as => [:displayable]
    t.data_stamp :index_as => [:displayable]

    t.upload_date :index_as => [:stored_sortable], :type=>:date
  end

  def self.xml_template
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.fields
    end
    builder.doc
  end

end