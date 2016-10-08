get '/decks/:deck_id/card/:id' do
	@card = Card.find(params[:id])
	erb :'cards/show'
end