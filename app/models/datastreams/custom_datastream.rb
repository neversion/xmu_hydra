#自定义的非DC对应字段

class CustomDatastream < ActiveFedora::OmDatastream
  set_terminology do |t|
    t.root(:path => "fields")
    t.title :index_as => [:stored_searchable]
    t.subtitle :index_as => [:stored_searchable]
    t.keyword :index_as => [:stored_searchable]
    t.creator :index_as => [:stored_searchable]
    t.set_number :index_as => [:stored_searchable]
    t.call_number :index_as => [:stored_searchable]
    t.class1 :index_as => [:stored_searchable]
    t.class2 :index_as => [:stored_searchable]
    t.format :index_as => [:stored_searchable]
    t.format_number :index_as => [:stored_searchable]
    t.media_format :index_as => [:stored_searchable]
    t.description :index_as => [:stored_searchable]
    t.publisher :index_as => [:stored_searchable]
    t.url :index_as => [:stored_searchable]
    t.becount :index_as => [:stored_searchable]
    t.publish_date :index_as => [:stored_searchable]
    t.extra_format :index_as => [:stored_searchable]
    t.app_format :index_as => [:stored_searchable]
    t.cover_pic :index_as => [:stored_searchable]
    t.the_time :index_as => [:stored_searchable]
    t.data_stamp :index_as => [:stored_searchable]
  end

  def self.xml_template
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.fields
    end
    builder.doc
  end

end