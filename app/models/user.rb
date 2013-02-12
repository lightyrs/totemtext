class User < ActiveRecord::Base

  rolify

  has_many :document_users

  has_many :documents,   through: :document_users
  has_many :thoughts,    through: :documents
  has_many :attachments, through: :documents
  has_many :links,       through: :documents

  attr_accessible :role_ids, as: :admin
  attr_accessible :provider, :uid, :name, :email

  def previous_document
    documents.order('created_at DESC').limit(1).pop
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] rescue ""
        user.email = auth['info']['email'] rescue ""
        user.location = auth['info']['location'] rescue "Earth"
        user.avatar = auth['info']['image'] rescue ""
        user.profile_url = auth['info']['urls']['Facebook'] rescue ""
      end
    end
  end
end
