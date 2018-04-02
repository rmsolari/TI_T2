class Entry < ApplicationRecord
  has_many :comments
  validates :title, presence: true

  def short_body
    string=body[0,5]+"..."
    "#{string}"

  end

end
