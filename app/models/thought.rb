class Thought < ActiveRecord::Base

  acts_as_taggable

  has_many :document_fragments
  has_many :documents, through: :document_fragments

  attr_accessible :content
end