class CreateDocumentAttachments < ActiveRecord::Migration

  def change
    create_table :document_attachments do |t|
      t.integer :attachment_id, :null => false
      t.integer :document_id, :null => false

      t.timestamps
    end

    add_index :document_attachments, :attachment_id
    add_index :document_attachments, :document_id
  end
end
