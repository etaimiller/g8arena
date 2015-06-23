class TeamManager

  attr_accessor :user_list

  def initialize(user_list_args)
    self.user_list = user_list_args
  end

  def assemble
    Team.transaction(requires_new: true) do
      begin
        team = Team.create
        team.users = convert_to_users_collection
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

end