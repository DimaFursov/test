class Project < ActiveRecord::Base
  belongs_to :user # @user.project.build
  default_scope -> { order(created_at: :desc) }  
  validates :user_id, presence: true  
  validates :Project, presence: true, length: { maximum: 140 }  
  validates :tasks, presence: true, length: { maximum: 140 }    
end
