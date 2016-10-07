class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :round_id
      t.string :card_id
      t.boolean :correct, :default => false
      t.integer :counter, :default => 0

      t.timestamps(null: false)
    end
  end
end
