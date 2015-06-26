class MatchesController < ApplicationController
  before_action :authenticate_user!

  def create
    match_processor = MatchProcessor.new(match_params)
    @match = match_processor.create_match
    if @match.present? && @match.save
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
    @matches = Match.all
    if @matches.empty?
      render json: {
        status: 'success',
        data: nil
      }, status: :no_content
    else
      render json: {
        status: 'success',
        data: @matches
      }, status: :ok
    end
  end

  private
    def match_params
      params.require(:match).permit(:result)
    end

end

