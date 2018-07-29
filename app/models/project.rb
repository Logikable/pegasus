require 'elasticsearch/model'

class Project < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :title, type: :text, analyzer: :english
      indexes :description, type: :text, analyzer: :english
    end
  end

  has_many :stars, dependent: :destroy
  has_many :users, :through => :stars
  belongs_to :team
end
