json.array! @comments do |comment|
  json.id comment.id
  json.name comment.name
  json.body post.body
  json.entry do
    json.id comment.entry.id
    json.title comment.entry.title
  end
end
