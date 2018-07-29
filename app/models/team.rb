class Team < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :name, type: :text, analyzer: :english
      indexes :description, type: :text, analyzer: :english
    end
  end

  has_many :users
  has_many :projects
end