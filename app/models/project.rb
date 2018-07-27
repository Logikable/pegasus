class Project < ApplicationRecord
  has_many :stars, dependent: :destroy
  has_many :users, :through => :stars
  belongs_to :team
end
