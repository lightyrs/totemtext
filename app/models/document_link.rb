class DocumentLink < ActiveRecord::Base

  belongs_to :document
  belongs_to :link
end