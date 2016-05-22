class Subject < ApplicationRecord
  belongs_to :department
  has_many :groups
  has_many :user_subjects
  has_many :users, :through => :user_subjects
  has_many :post_subjects
end