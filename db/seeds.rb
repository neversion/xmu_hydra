require 'roo'
require 'rmmseg'
require 'date'

def import_sample
  begin
    file = Roo::Openoffice.new("#{Rails.root}/public/data/dmt.ods")
    file.default_sheet = file.sheets.first
    line_count=file.last_row
    temp_index=1
    2.upto(line_count) do |line|
      item = GenericItem.new
      item.title=file.cell(line, 2).to_s
      item.subtitle=file.cell(line, 3).to_s
      item.keyword=file.cell(line, 4).to_s
      item.creator=file.cell(line, 5).to_s
      item.set_number=file.cell(line, 6).to_s
      item.call_number=file.cell(line, 7).to_s
      item.class1=file.cell(line, 8).to_s
      item.class2=file.cell(line, 9).to_s
      item.format=file.cell(line, 10).to_s
      item.format_number=file.cell(line, 11).to_s
      item.media_format=file.cell(line, 12).to_s
      item.description=file.cell(line, 13).to_s
      item.publisher=file.cell(line, 14).to_s
      item.url = file.cell(line, 15).to_s
      item.becount=file.cell(line, 16).to_s
      begin
        item.publish_date= Date.parse(file.cell(line, 17).to_s)
      rescue
        item.publish_date= Time.new.strftime "%Y-%m-%d %H:%M:%S"
      end
      item.extra_format= file.cell(line, 18).to_s
      item.cover_pic= file.cell(line, 19).to_s
      item.data_stamp= file.cell(line, 20).to_s
      now = Time.new
      item.upload_date = now.strftime "%Y-%m-%d %H:%M:%S"
      item.upload_timestamp=now.to_i
      puts "#{temp_index} #{item.title} #{item.upload_date}"
      temp_index +=1
      item.save
    end
  rescue Exception => e
    puts e.backtrace
    puts e.message

  end
end

import_sample