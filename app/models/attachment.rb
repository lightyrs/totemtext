class Attachment < ActiveRecord::Base

  has_many :document_attachments
  has_many :documents, through: :document_attachments

  attr_accessible :url, :filetype, :filesize
end