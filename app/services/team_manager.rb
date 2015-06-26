class TeamManager

  attr_accessor :user_list

  def initialize(user_list_args)
    self.user_list = user_list_args
  end

  def assemble
    Team.transaction(requires_new: true) do
      begin
        users = convert_to_users_collection
        team_already_exists?(users)
        team = Team.create
        team.users = users
        team.save!
        team
      rescue
        raise ActiveRecord::Rollback
        return nil
      end
    end
  end


  def convert_to_users_collection
    @users = []
    all_ok = true
    JSON.parse(user_list[:users]).each do |user_params|
      if user_params['id'].present?
        if user = User.find(user_params['id'])
          @users << user
        else
          all_ok = false
        end
      else
        all_ok = false
      end
    end

    if all_ok
      @users
    else
      nil
    end
  end

  def team_already_exists?(users)
    team_exists = false
    Team.all.each do |team|
      if team.users.sort == users.sort
        team_exists = true
      end
    end
    if team_exists
      raise ActiveRecord::RecordInvalid
    end
  end

end