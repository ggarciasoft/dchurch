json.array!(@members) do |member|
  json.extract! member, :FirstName, :LastName
  json.url member_url(member, format: :json)
end
