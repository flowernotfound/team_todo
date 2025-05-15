class Api::TeamsController < ApplicationController
	def index
		teams = Team.all
		render json: teams.select(:id, :name, :owner_id)
	end

	def create
		team = Team.new(team_params)
		if team.save
			render json: team.slice(:id, :name, :owner_id, :created_at, :updated_at), status: :created, location: api_team_url(team)
		else
			render json: { errors: team.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def show
		team = Team.find(params[:id])
		render json: team.slice(:id, :name, :owner_id, :created_at, :updated_at)
	end

	def destroy
		team = Team.find_by(id: params[:id])
		if team
			team.destroy
			head :no_content
		else
			render json: { error: "Team not found" }, status: :not_found
		end
	end

	private

	def team_params
		params.require(:team).permit(:name, :owner_id)
	end
end
