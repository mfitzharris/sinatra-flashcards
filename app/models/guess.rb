class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card
  belongs_to :user, through: :round

  #attributes are: round_id, card_id, correct, counter
  #correct is type boolean with default value of false
  #counter is type integer

  def correct?

  end
end


#hypothetical route
#user's input is params[:answer]
#this is the route where we get the answer back from the user
# post 'some address/:id' do
#   if Card.find_by(id: params[:id]).correct_answer?(params[:answer])
# end

end

