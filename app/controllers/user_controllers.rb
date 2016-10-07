get '/users/new' do
	erb :'/users/show'
end

post '/users' do
	user = User.new(username: params[:username], email: params[:email], password_hash: params[:password_hash])

	if user.save
		session[:user_id] = user.id
		redirect '/'
	else
		@errors = user.errors.full_messages
		erb :'/users/new'
	end
end