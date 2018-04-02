json.array! @comments do |comment|
  json.id comment.id
  json.author comment.author
  json.comment comment.body
  json.created_at comment.created_at
  end
