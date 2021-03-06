class User < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :name, type: :text
      indexes :email, type: :text
      indexes :role, type: :text, analyzer: :english
    end
  end
  
  has_many :stars, :foreign_key => :starree_id
  has_many :projects, :through => :stars

  has_many :project_collaborators, dependent: :destroy
  has_many :projects, :through => :project_collaborators
  
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
