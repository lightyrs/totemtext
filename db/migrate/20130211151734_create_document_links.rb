class CreateDocumentLinks < ActiveRecord::Migration

  def change
    create_table :document_links do |t|
      t.integer :document_id, :null => false
      t.integer :link_id, :null => false

      t.timestamps
    end

    add_index :document_links, :document_id
    add_index :document_links, :link_id
  end
end
