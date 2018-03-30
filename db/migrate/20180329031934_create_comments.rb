class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.text :author
      t.belongs_to :entry, foreign_key: true

      t.timestamps
    end
  end
end
