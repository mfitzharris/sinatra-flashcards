class CreateRounds < ActiveRecord::Migration
 def change
    create_table :rounds do |t|
      t.string :deck_id
      t.string :user_id

      t.timestamps(null: false)
    end
  end
end
