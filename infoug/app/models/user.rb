class User < ApplicationRecord
  #validates :name, presence: true, length: { minimum: 4, maximum: 12 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :user_departments
  has_many :department, :through => :user_departments
  has_many :user_subjects
  has_many :subject, :through => :user_subjects
  has_many :user_groups
  has_many :group, :through => :user_groups
  has_many :post_departments
  has_many :post_subjects
  has_many :post_groups
end
