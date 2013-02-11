class CreateDocumentFragments < ActiveRecord::Migration

  def change
    create_table :document_fragments do |t|
      t.integer :document_id, :null => false
      t.integer :fragment_id, :null => false

      t.timestamps
    end

    add_index :document_fragments, :document_id
    add_index :document_fragments, :fragment_id
  end
end
