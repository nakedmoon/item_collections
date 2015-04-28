json.array!(@items) do |item|
  json.extract! item, :id, :descripition, :url
  json.url item_url(item, format: :json)
end
