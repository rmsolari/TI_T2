class EntrySerializer < ActiveModel::Serializer
  attributes :id, :title, ,:subtitle, :body
  has_many :comments

  class CommentSerializer < ActiveModel::Serializer
    attributes :id, :name, :body
    belongs_to :entry
  end
end
