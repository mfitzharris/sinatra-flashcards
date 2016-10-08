get '/decks' do
	@decks = Deck.all
	erb :login_logout do
		erb :'decks/index'
	end
end