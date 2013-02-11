class Link < ActiveRecord::Base

  acts_as_taggable

  has_many :document_links
  has_many :documents, through: :document_links

  attr_accessible :url, :title, :description,
                  :thumbnail, :domain, :brand, :category
end