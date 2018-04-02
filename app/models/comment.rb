class Comment < ApplicationRecord
  belongs_to :entry
  validates :author, presence: true
  validates :body, presence: true
end
