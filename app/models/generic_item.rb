class GenericItem < ActiveFedora::Base
  has_metadata 'descMetadata', type: CustomDatastream

  has_attributes :title, datastream: 'descMetadata', multiple: true
  has_attributes :variant_title, datastream: 'descMetadata', multiple: true
  has_attributes :series_statement, datastream: 'descMetadata', multiple: true
  has_attributes :keyword, datastream: 'descMetadata', multiple: true
  has_attributes :creator, datastream: 'descMetadata', multiple: true
  has_attributes :set_number, datastream: 'descMetadata', multiple: false
  has_attributes :call_number, datastream: 'descMetadata', multiple: false
  has_attributes :content_type, datastream: 'descMetadata', multiple: false
  has_attributes :carrier_type, datastream: 'descMetadata', multiple: false
  has_attributes :extent, datastream: 'descMetadata', multiple: false
  has_attributes :media_type, datastream: 'descMetadata', multiple: false
  has_attributes :summarization_of_the_content, datastream: 'descMetadata', multiple: true
  has_attributes :publisher_name, datastream: 'descMetadata', multiple: true
  has_attributes :uniform_resource_locator, datastream: 'descMetadata', multiple: false
  has_attributes :date_of_publication, datastream: 'descMetadata', multiple: false
  has_attributes :digital_file_type, datastream: 'descMetadata', multiple: false
  has_attributes :illustrative_content, datastream: 'descMetadata', multiple: true
  has_attributes :duration, datastream: 'descMetadata', multiple: false
  has_attributes :dimensions, datastream: 'descMetadata', multiple: false
  has_attributes :performer_narrator_presenter, datastream: 'descMetadata', multiple: true
  has_attributes :relationship_designator, datastream: 'descMetadata', multiple: true
  has_attributes :contributor, datastream: 'descMetadata', multiple: true
  has_attributes :language_of_content, datastream: 'descMetadata', multiple: false

  has_attributes :upload_date, datastream: 'descMetadata', multiple: false
  has_attributes :upload_timestamp, datastream: 'descMetadata', multiple: false

  #用户能够编辑的字段
  def terms_for_editing
    terms_for_display -
        [:upload_date, :upload_timestamp]
  end

  #显示的字段
  def terms_for_display
    # 'type' is the RDF.type assertion, which is not present by default, but may be
    # provided in some RDF schemas
    #self.descMetadata.class.fields
    [:title,:variant_title,:series_statement,:keyword,:creator,:set_number,:call_number,:content_type,
    :carrier_type,:extent,:media_type,:summarization_of_the_content,:publisher_name,:uniform_resource_locator,
    :date_of_publication,:digital_file_type,:illustrative_content,:duration,:dimensions,:performer_narrator_presenter,
    :relationship_designator,:contributor,:language_of_content,:upload_date]
  end
end