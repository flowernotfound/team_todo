class Team < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id', primary_key: 'id'
  has_many :tasks, class_name: 'Task', foreign_key: 'team_id', primary_key: 'id', dependent: :destroy
  has_many :members, class_name: 'Member', foreign_key: 'team_id', primary_key: 'id', dependent: :destroy
  has_many :users, through: :members, source: :user
  validates :name, presence: true
end
