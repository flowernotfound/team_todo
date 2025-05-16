class Task < ApplicationRecord
  belongs_to :team, class_name: 'Team', foreign_key: 'team_id', primary_key: 'id'
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id', primary_key: 'id', optional: true
  validates :title, presence: true
  validates :body, presence: true
  validates :status, presence: true
end
