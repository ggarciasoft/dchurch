json.array!(@positions) do |position|
  json.extract! position, :id, :Id, :Description, :Active
  json.url position_url(position, format: :json)
end
