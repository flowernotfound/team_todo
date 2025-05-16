class Api::TasksController < ApplicationController
	def index
    team = Team.find(params[:team_id])
		tasks = team.tasks.select(:id, :title, :body, :status, :assignee_id, :created_at, :updated_at)
		render json: tasks
	end

  def create
    team = Team.find_by(id: params[:team_id])
    if team.nil?
      return render json: { error: "Team not found" }, status: :not_found
    end
    task = team.tasks.build(task_params)
    if task.save
      render json: task.slice(:id, :title, :body, :status, :assignee_id, :created_at, :updated_at), status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :status, :assignee_id)
  end
end
