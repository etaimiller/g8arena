class MatchesController < ActionController::Base
  before_action :authenticate_user!

  def create
    @match = Match.new(match_params)
    if @match.save
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