class CreateLinks < ActiveRecord::Migration

  def change
    create_table :links do |t|
      t.string :url
      t.string :thumbnail
      t.string :title
      t.text   :description
      t.string :domain
      t.string :brand
      t.string :category

      t.timestamps
    end
  end
end
