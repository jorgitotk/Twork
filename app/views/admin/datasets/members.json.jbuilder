json.array! @members do |member|
  json.id member.id
  json.full_name member.first_name + ' ' + member.last_name
end