class Star < ApplicationRecord
  belongs_to :starree, class_name: 'User', foreign_key: :starree_id
  belongs_to :starrer, class_name: 'User', foreign_key: :starrer_id
  belongs_to :project
end
