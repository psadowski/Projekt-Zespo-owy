class Group < ApplicationRecord
  belongs_to :subject
  has_many :user_groups
  has_many :users, :through => :user_groups
  has_many :post_groups
end
