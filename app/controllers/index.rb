before do
  # clear the session errors
end

get '/' do
  erb :index
end

get '/user/new' do
  if session.has_key?(:user)
    erb :secret_page
  else
    redirect '/'
  end
end

post '/user/new' do
  @current_user = User.create(params[:user])
  erb :secret_page
end

get '/logout' do
  logout
  redirect '/'
end

get '/authenticate' do
  @inputted_email = params[:email]
  @inputted_password = params[:password]

  user = User.authenticate(@inputted_email, @inputted_password, session)
  if user
    redirect '/user/new'
  else
    @error = true
    erb :index
    #redirect '/'
  end
end
