class DocumentFragment < ActiveRecord::Base

  belongs_to :document
  belongs_to :thought
end