get '/decks/:deck_id/cards/:card_id/rounds/:round_id/guesses' do

	@card = Card.find(params[:card_id])
	@guess_id = Guess.find_by(round_id: params[:round_id], card_id: params[:card_id]).id

	redirect "decks/#{params[:deck_id]}/cards/#{params[:card_id]}/rounds/#{params[:round_id]}/guesses/#{@guess_id}"

end

get '/decks/:deck_id/cards/:card_id/rounds/:round_id/guesses/:id' do

	@deck_id = params[:deck_id]
	@card = Card.find(params[:card_id])
	@round_id = params[:round_id]
	@guess_id = params[:id]

	erb :login_logout do
		erb :'cards/show'
	end

end

put '/decks/:deck_id/cards/:card_id/rounds/:round_id/guesses/:guess_id' do

	recent_guess = params[:guess]
	card = Card.find(params[:card_id])

	guess = Guess.find(params[:guess_id])

	# #MVP logic. this will have to change when we random shuffle deck
	# @card_id = params[:card_id].to_i + 1

	guess.counter += 1

	if card.answer == recent_guess
		guess.update(correct: true)
	end

	@card_id = Deck.find(params[:deck_id]).cards.where( )
	@round = Round.find(params[:round_id])
	false_guesses = @round.guesses.select { |g| g.correct == false }

	if false_guesses.length == 0
		erb :'/rounds/show'
	else
		@card_id = false_guesses.sample.card_id
		redirect "decks/#{params[:deck_id]}/cards/#{@card_id}/rounds/#{params[:round_id]}/guesses"
	end
end


