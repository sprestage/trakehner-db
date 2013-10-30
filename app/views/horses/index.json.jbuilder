json.array!(@horses) do |horse|
  json.extract! horse, :name
  json.url horse_url(horse, format: :json)
end
