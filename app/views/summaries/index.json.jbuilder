json.array!(@summaries) do |summary|
  json.extract! summary, :id, :post_id, :body
  json.url summary_url(summary, format: :json)
end
