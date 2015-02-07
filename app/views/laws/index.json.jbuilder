json.array!(@laws) do |law|
  json.extract! law, :id, :number, :article, :description
  json.url law_url(law, format: :json)
end
