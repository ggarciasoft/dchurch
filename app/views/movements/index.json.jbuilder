json.array!(@movements) do |movement|
  json.extract! movement, :id, :Id, :MovementDate, :movementtype_id, :entitytype_id, :EntityReference, :asset_id, :AssetQuantity
  json.url movement_url(movement, format: :json)
end
