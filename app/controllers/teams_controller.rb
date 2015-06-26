class TeamsController < ApplicationController
  before_action :authenticate_user!

  def create
    team_manager = TeamManager.new(team_params)
    @team = team_manager.assemble
    if @team.present? && @team.save
      render json: {
        status: 'success',
        data: @team
      }, status: :ok
    else
      render json: {
        status: 'error',
        errors: 'Could not create team'
      }, status: :unprocessable_entity
    end
  end

  def index
    @teams = Team.all
    if @teams.empty?
      render json: {
        status: 'success',
        data: nil
      }, status: :no_content
    else
      teams_with_members = []
      @teams.each do |team|
        teams_with_members << hash_team_data(team)
      end
      render json: {
        status: 'success',
        data: teams_with_members
      }, status: :ok
    end
  end

  def available_users
    @users = User.all
    if @users.empty?
      render json: {
        status: 'success',
        data: nil
      }, status: :no_content
    else
      render json: {
        status: 'success',
        data: @users
      }, status: :ok
    end
  end

  private
    def team_params
      params.require(:team).permit(:users)
    end

    def hash_team_data(team)
      new_hash = team.attributes
      new_hash[:users] = []
      team.users.each do |user|
        new_hash[:users] << user
      end
      return new_hash
    end

end