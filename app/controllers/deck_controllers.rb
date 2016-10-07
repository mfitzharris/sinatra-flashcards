get '/decks'
	@decks = Deck.all
	erb :'decks/index'
end