class Department < ApplicationRecord
    has_many :subjects
    has_many :user_departments
    has_many :users, :through => :user_departments
    has_many :post_departments
end
