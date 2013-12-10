require 'roo'
require 'rmmseg'
require 'date'

def import_sample file_name
  begin
    file = Roo::Openoffice.new("#{Rails.root}/public/data/#{file_name}")
    file.default_sheet = file.sheets.first
    line_count=file.last_row
    temp_index=1
    4.upto(line_count) do |line|
      begin
        item = GenericItem.new
        item.title=file.cell(line, 2).to_s
        item.series_statement=file.cell(line, 3).to_s
        item.keyword=file.cell(line, 4).to_s.split(' ')

        item.creator=file.cell(line, 5).to_s
        item.set_number=file.cell(line, 6).to_s
        item.call_number=file.cell(line, 7).to_s
        item.content_type=file.cell(line, 8).to_s
        item.carrier_type=file.cell(line, 10).to_s
        item.extent=file.cell(line, 11).to_s
        item.media_type=file.cell(line, 12).to_s
        item.summarization_of_the_content=file.cell(line, 13).to_s
        item.publisher_name=file.cell(line, 14).to_s
        item.uniform_resource_locator = file.cell(line, 15).to_s
        item.digital_file_type=file.cell(line, 17).to_s
        item.illustrative_content=file.cell(line, 18).to_s
        item.duration=file.cell(line, 19).to_s
        item.dimensions=file.cell(line, 20).to_s
        item.performer_narrator_presenter=file.cell(line, 21).to_s
        item.relationship_designaor=file.cell(line, 22).to_s
        item.contributor=file.cell(line, 23).to_s
        item.language_of_content=file.cell(line, 24).to_s

        begin
          if file.cell(line, 16).to_s.length==4
            item.date_of_publication= Date.parse("#{file.cell(line, 16).to_s}-01-01")
          else
            item.date_of_publication= Date.parse(file.cell(line, 16).to_s)
          end
        rescue
          #item.date_of_publication= Time.new.strftime "%Y-%m-%d %H:%M:%S"
        end

        now = Time.new
        item.upload_date = now.strftime "%Y-%m-%d %H:%M:%S"
        item.upload_timestamp=now.to_i
        puts "#{temp_index} #{item.title} #{item.upload_date}"
        temp_index +=1
        item.save
      rescue Exception => e
        logger.error line
        logger.error e.message
      end
    end
  rescue Exception => e
    puts e.backtrace
    puts e.message
  end
end

def clean_title str
  return str.split("\\").last.split('.')[0]
end

def del_all
  GenericItem.all.each do |item|
    item.destroy
  end
  puts "del done"
end

#批量更新超星视频的出版社信息
def update_cx_publisher
  (9579..15162).each do |index|
    g = GenericItem.find("changeme:#{index.to_s}")

    g.publisher_name="超星视频"
    g.save
    puts index
  end
end

#import_sample "cx.ods"
update_cx_publisher
#del_all
