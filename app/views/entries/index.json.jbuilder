json.array!(@entries) do |entry|
  json.extract! entry, :id, :title, :date, :contents
  json.url entry_url(entry, format: :json)
end
