class TeamsController < ActionController::Base
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
      render json: {
      status: 'success',
      data: @teams
    }, status: :ok
    end
  end

  private
    def team_params
      params.require(:team).permit(:users)
    end

end