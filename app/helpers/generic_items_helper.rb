module GenericItemsHelper
  #各字段中文名
  def get_label(key)
    fields = [:title, :variant_title, :series_statement, :keyword, :creator, :set_number, :call_number, :content_type,
              :carrier_type, :extent, :media_type, :summarization_of_the_content, :publisher_name, :uniform_resource_locator,
              :date_of_publication, :digital_file_type, :illustrative_content, :duration, :dimensions, :performer_narrator_presenter,
              :relationship_designator, :contributor, :language_of_content, :upload_date]
    temp_index=-1
    fields.each_with_index do |item, index|
      if item==key
        temp_index=index
        break
      end
    end
    label_list = ["2.3.2 题名 Title", "2.3.6 副标题 Variant title", "2.12 丛编说明 Series statement",
                  "关键字 Keyword", "19.2 创建者 Creator", "Set number", "索取号 Call Number", "6.9 内容类型 Content Type",
                  "3.3 载体类型 Carrier type", "3.4 数量/篇幅 Extent", "3.2 媒介类型 Media type", "7.10 内容摘要 Summarization_of_the content",
                  "2.8.4 出版社 Publisher’s name", "4.6 URL Uniform Resource Locator",
                  "2.8.6 出版日期 Date of publication", "3.19.2 数字文件类型 Digital file type", "7.15 插图内容 Illustrative content",
                  "7.22 持续时间 Duration", "3.5 尺寸 Dimensions", "7.23 出演者 Performer,Narrator,and/or Presenter",
                  "Relationship designator", "20.2 贡献者 Contributor", "7.12 内容的语言 Language of content", "上传时间"]
    return label_list[temp_index]

  end

  #所否必填字段
  def required?(key)
    required_fields=[:title, :creator, :content_type, :carrier_type,
                     :media_type, :summarization_of_the_content,
                     :publisher_name, :uniform_resource_locator]
    required_fields.include?(key)
  end
end
