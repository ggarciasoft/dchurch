json.array!(@members) do |member|
  json.extract! member, :id, :Id, :FirstName, :LastName, :BirthDate, :ConvertionDate, :Address, :HomePhone, :CellPhone, :BaptismDate, :Active
  json.url member_url(member, format: :json)
end
