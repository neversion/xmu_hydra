class GenericItem < ActiveFedora::Base
  has_metadata 'descMetadata', type: CustomDatastream

  has_attributes :title, datastream: 'descMetadata', multiple: false
  has_attributes :subtitle, datastream: 'descMetadata', multiple: false
  has_attributes :keyword, datastream: 'descMetadata', multiple: false
  has_attributes :creator, datastream: 'descMetadata', multiple: false
  has_attributes :set_number, datastream: 'descMetadata', multiple: false
  has_attributes :call_number, datastream: 'descMetadata', multiple: false
  has_attributes :class1, datastream: 'descMetadata', multiple: false
  has_attributes :class2, datastream: 'descMetadata', multiple: false
  has_attributes :format, datastream: 'descMetadata', multiple: false
  has_attributes :format_number, datastream: 'descMetadata', multiple: false
  has_attributes :media_format, datastream: 'descMetadata', multiple: false
  has_attributes :description, datastream: 'descMetadata', multiple: false
  has_attributes :publisher, datastream: 'descMetadata', multiple: false
  has_attributes :url, datastream: 'descMetadata', multiple: false
  has_attributes :becount, datastream: 'descMetadata', multiple: false
  has_attributes :publish_date, datastream: 'descMetadata', multiple: false
  has_attributes :extra_format, datastream: 'descMetadata', multiple: false
  has_attributes :app_format, datastream: 'descMetadata', multiple: false
  has_attributes :cover_pic, datastream: 'descMetadata', multiple: false
  has_attributes :the_time, datastream: 'descMetadata', multiple: false
  has_attributes :data_stamp, datastream: 'descMetadata', multiple: false

  has_attributes :upload_date, datastream: 'descMetadata', multiple: false
  has_attributes :upload_timestamp, datastream: 'descMetadata', multiple: false
end