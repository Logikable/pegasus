class User < ApplicationRecord
  has_many :stars, :foreign_key => :starree_id
  has_many :projects, :through => :stars
  belongs_to :team
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize(
      xp: 0,
      role: "",
      team: ""
    ).tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
