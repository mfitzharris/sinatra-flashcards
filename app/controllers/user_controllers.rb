get '/users/new' do
	erb :'users/new'
end

post '/users' do
	user = User.new(username: params[:username], email: params[:email], password: params[:password])

	if user.save
		p user.password
		session[:user_id] = user.id
		redirect '/'
	else
		@errors = user.errors.full_messages
		erb :'users/new'
	end
end

get '/users/login' do
	erb :'users/login'
end

post '/users/login' do
	user = User.find_by(username: params[:username])
	if !user
		@errors = ["Invalid username or password"]
		erb :'users/login'
	elsif user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect '/'
	else
		@errors = ["Invalid username or password"]
		erb :'users/login'
	end
end

delete '/users/logout' do
	session.delete(:user_id)

	redirect '/'
end

get '/users/:id' do
	if User.find_by(id: session[:user_id]) == User.find_by(id: params[:id])	
		@user = User.find_by(id: params[:id])
		erb :'users/show'
	else 
		p session.inspect
	end
end
