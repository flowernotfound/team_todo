class Task < ApplicationRecord
  belongs_to :team
  belongs_to :assignee
end
