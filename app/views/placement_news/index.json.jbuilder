json.array!(@placement_news) do |placement_news|
  json.extract! placement_news, :id, :title, :content
  json.url placement_news_url(placement_news, format: :json)
end
