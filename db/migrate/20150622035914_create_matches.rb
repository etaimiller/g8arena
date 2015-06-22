class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|

      t.json :result
      t.timestamps null: false
    end
  end
end
