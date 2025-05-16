class User < ApplicationRecord
  has_secure_password
  has_many :owned_teams, class_name: 'Team', foreign_key: 'owner_id', primary_key: 'id', dependent: :destroy
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assignee_id', primary_key: 'id'
  has_many :members, class_name: 'Member', foreign_key: 'user_id', primary_key: 'id', dependent: :destroy
  has_many :teams, through: :members, source: :team
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, on: :create
end
