class Api::TasksController < ApplicationController
	def index
    team = Team.find(params[:team_id])
		tasks = team.tasks.select(:id, :title, :body, :status, :assignee_id, :created_at, :updated_at)
		render json: tasks
	end
end
