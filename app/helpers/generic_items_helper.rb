module GenericItemsHelper
  #各字段中文名
  def get_label(key)
    fields = [:title,:variant_title,:series_statement,:keyword,:creator,:set_number,:call_number,:content_type,
              :carrier_type,:extent,:media_type,:summarization_of_the_content,:publisher_name,:uniform_resource_locator,
              :date_of_publication,:digital_file_type,:illustrative_content,:duration,:dimensions,:performer_narrator_presenter,
              :relationship_designaor,:contributor,:language_of_content,:upload_date]
    temp_index=-1
    fields.each_with_index do |item, index|
      if item==key
        temp_index=index
        break
      end
    end
      label_list = ["标题","副标题","副标题","关键字","创建者","set_number","索取号","内容类型",
       "载体",:extent,"媒体类型","简介","出版社","URL",
       "出版日期","数字文件类型","插图","时长","dimensions","performer_narrator_presenter",
       "relationship_designaor","contributor","语言","上传时间"]
      return label_list[temp_index]

  end

  #所否必填字段
  def required?(key)
    required_fields=[:title,:creator,:content_type,:carrier_type,
                     :media_type,:summarization_of_the_content,
                     :publisher_name,:uniform_resource_locator ]
    required_fields.include?(key)
  end
end
