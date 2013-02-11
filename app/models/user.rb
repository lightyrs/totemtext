class User < ActiveRecord::Base

  rolify

  attr_accessible :role_ids, as: :admin
  attr_accessible :provider, :uid, :name, :email

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
