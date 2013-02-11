class Document < ActiveRecord::Base

  acts_as_taggable

  belongs_to :user

  has_many   :document_attachments
  has_many   :document_links
  has_many   :document_fragments
  has_many   :attachments, through: :document_attachments
  has_many   :links, through: :document_links
  has_many   :thoughts, through: :document_fragments
end