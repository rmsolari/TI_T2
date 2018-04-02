class Comment < ApplicationRecord
  belongs_to :entry
  validates :name, presence: true
  validates :body, presence: true
end
