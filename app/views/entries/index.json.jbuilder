json.array! @entries do |entry|
  json.id entry.id
  json.title entry.title
  json.subtitle entry.subtitle
  json.body entry.short_body
  json.created_at entry.created_at
end
