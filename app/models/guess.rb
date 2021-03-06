class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card
  has_one :user, through: :round, source: :user

  #belongs to cannot have a through
  # belongs_to :user, through: :round

  #attributes are: round_id, card_id, correct, counter
  #correct is type boolean with default value of false
  #counter is type integer
end
