class CreateTeamMatches < ActiveRecord::Migration
  def change
    create_table :team_matches do |t|
      t.belongs_to :team, index: true
      t.belongs_to :match, index: true

      t.timestamps null: false
    end
  end
end
