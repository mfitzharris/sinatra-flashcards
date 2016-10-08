get '/decks/:deck_id/cards/:card_id/rounds/:round_id/guesses' do

	@card = Card.find_by(id: params[:card_id])
	guess = Guess.find_by(round_id: params[:round_id], card_id: params[:card_id])

	if guess
		@guess_id = guess.id
	else
		@guess_id = Guess.create(round_id: params[:round_id], card_id: params[:card_id]).id
	end

	redirect "decks/#{params[:deck_id]}/cards/#{params[:card_id]}/rounds/#{params[:round_id]}/guesses/#{@guess_id}"

end

get '/decks/:deck_id/cards/:card_id/rounds/:round_id/guesses/:id' do

	@deck_id = params[:deck_id]
	@card = Card.find_by(id: params[:card_id])
	@round_id = params[:round_id]
	@guess_id = params[:id]

	if @card
		erb :login_logout do
			erb :'cards/show'
		end
	else
		redirect '/decks'
	end
	
end

put '/decks/:deck_id/cards/:card_id/rounds/:round_id/guesses/:guess_id' do

	recent_guess = params[:guess]
	card = Card.find_by(id: params[:card_id])

	guess = Guess.find_by(id: params[:guess_id])


	#MVP logic. this will have to change when we random shuffle deck
	@card_id = params[:card_id].to_i + 1

	guess.counter += 1

	if card.answer == recent_guess
		guess.correct == true
	end

	redirect "decks/#{params[:deck_id]}/cards/#{@card_id}/rounds/#{params[:round_id]}/guesses"

end


