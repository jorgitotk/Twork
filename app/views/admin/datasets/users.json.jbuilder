json.array! @users do |user|
  json.id user.id
  json.full_name user.first_name + ' ' + user.last_name
end