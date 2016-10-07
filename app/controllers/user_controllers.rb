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

get '/users/login' do
	erb :'users/login'
end

post '/users/login' do
	user = User.find_by(username: params[:username])

	if user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect '/'
	else
		@errors = ["Invalid username of password"]
		erb :'users/login'
	end
end