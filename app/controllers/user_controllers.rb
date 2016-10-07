get '/users/new' do
	erb :'/users/show'
end

post '/users' do
	@user = User.create(username: params[:username], email: params[:email], password_hash: params[:password_hash])

	redirect '/'
end