#Instead of posting to a decks controller to create a round as we had discussed, it seems restful to post to a round route to create the round. Im open to ideas on this.

post '/decks/:deck_id/round' do

	#remove this query once we get the current_user helper working
	user = User.find_by(id: session[:user_id])
	
	if user
		round = Round.create(deck_id: params[:deck_id], user_id: user.id)
	else
		round = Round.create(deck_id: params[:deck_id])
	end

	#MVP feature. Final project should shuffle the deck then return the card id of the first card in the shuffled deck
	card_id = Deck.find(params[:deck_id]).cards.first.id

	redirect "decks/#{params[:deck_id]}/cards/#{card_id}/round/#{round.id}"

end
