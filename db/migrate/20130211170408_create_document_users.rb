class CreateDocumentUsers < ActiveRecord::Migration

  def change
    create_table :document_users do |t|
      t.integer :document_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end

    add_index :document_users, :document_id
    add_index :document_users, :user_id
  end
end
