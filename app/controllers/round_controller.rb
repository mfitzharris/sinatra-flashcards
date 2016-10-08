#Instead of posting to a decks controller to create a round as we had discussed, it seems restful to post to a round route to create the round. Im open to ideas on this.

post '/decks/:deck_id/rounds' do

	#remove this query once we get the current_user helper working
	user = User.find_by(id: session[:user_id])
	deck = Deck.find(params[:deck_id])

	if user
		round = Round.create(deck_id: params[:deck_id], user_id: user.id)
	else
		round = Round.create(deck_id: params[:deck_id])
	end

	deck.cards.each do |card|
		Guess.create(round_id: round.id, card_id: card.id)
	end
	#MVP feature. Final project should shuffle the deck then return the card id of the first card in the shuffled deck
	card_id = Deck.find(params[:deck_id]).cards.sample.id

	redirect "decks/#{params[:deck_id]}/cards/#{card_id}/rounds/#{round.id}/guesses"

end

#This was the best way I could think to access a guess within an erb that submits a form with a guess to an answer. to access a guess we need a card id and round id, so those are now in the route params. I was considering storing the round id in sessions but the logic seemed convoluted and Matt and mentor John told me yesterday that sessions should user as little as possible to persist state. They both said rely on urls more often than sessions. I am open to other ideas though.
