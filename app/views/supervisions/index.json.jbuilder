json.array!(@supervisions) do |supervision|
  json.extract! supervision, :id, :notification_id, :observation
  json.url supervision_url(supervision, format: :json)
end
