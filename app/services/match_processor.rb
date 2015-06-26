class MatchProcessor

  attr_accessor :result

  def initialize(match_args)
    self.result = JSON.parse(match_args[:result])
  end

  def create_match
    Match.transaction(requires_new: true) do
      begin
        winning_team = Team.find(result['winning_team']['id'])
        losing_team = Team.find(result['losing_team']['id'])
        match = Match.create(result: result)
        match.teams << [winning_team, losing_team]
        match.save
        match
      rescue
        raise ActiveRecord::Rollback
        return nil
      end
    end
  end

end
