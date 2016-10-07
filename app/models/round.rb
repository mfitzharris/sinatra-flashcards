class Round < ActiveRecord::Base
  belongs_to :deck, :user
  has_many :guesses

  #Note, only attributes are deck_id and user_id
end
