#自定义的非DC对应字段

class CustomDatastream < ActiveFedora::OmDatastream
  set_terminology do |t|
    t.root(:path => "fields")
    t.title :index_as => [:stored_searchable]
    t.variant_title :index_as => [:stored_searchable]
    t.series_statement :index_as => [:stored_searchable]
    t.keyword :index_as => [:stored_searchable]
    t.creator :index_as => [:stored_searchable,:facetable]
    t.set_number :index_as => [:displayable]
    t.call_number :index_as => [:stored_searchable]
    t.content_type :index_as => [:stored_searchable]
    t.carrier_type :index_as => [:stored_searchable,:facetable]
    t.extent :index_as => [:displayable]
    t.media_type :index_as => [:stored_searchable,:facetable]
    t.summarization_of_the_content :index_as => [:stored_searchable]
    t.publisher_name :index_as => [:stored_searchable,:facetable]
    t.uniform_resource_locator :index_as => [:displayable]
    t.date_of_publication :index_as => [:stored_sortable], :type=>:date
    t.digital_file_type :index_as => [:displayable]
    t.illustrative_content :index_as => [:displayable]
    t.duration :index_as => [:stored_sortable], :type=>:integer
    t.dimensions :index_as => [:facetable]
    t.performer_narrator_presenter :index_as => [:stored_searchable,:facetable]
    t.relationship_designaor :index_as => [:stored_searchable,:facetable]
    t.contributor :index_as => [:stored_searchable,:facetable]
    t.language_of_content :index_as => [:facetable]

    t.upload_date :index_as => [:displayable]
    t.upload_timestamp :index_as => [:stored_sortable], :type=>:integer
  end

  def self.xml_template
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.fields
    end
    builder.doc
  end

end