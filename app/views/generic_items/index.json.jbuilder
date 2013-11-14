json.array!(@generic_items) do |generic_item|
  json.extract! generic_item, :title, :subtitle, :creator
  json.url generic_item_url(generic_item, format: :json)
end
