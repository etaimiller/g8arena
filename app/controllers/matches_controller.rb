class MatchesController < ActionController::Base
  before_action :authenticate_user!

  def create
    match_processor = MatchProcessor.new(match_params)
    @match = match_processor.added_match
    if @match.save && match_processor.update_teams
      render json: {
        status: 'success',
        data: @match
      }, status: :ok
    else
      render json: {
        status: 'error',
        errors: 'Could not create Match'
      }, status: :unprocessable_entity
    end
  end

  def index
  end

  private
    def match_params
      params.require(:match).permit(:result)
    end

end