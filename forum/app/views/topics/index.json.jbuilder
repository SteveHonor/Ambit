json.array!(@topics) do |topic|
  json.extract! topic, :id, :comment, :parent_id, :level
  json.url topic_url(topic, format: :json)
end
