helpers do
  def user_login
    if session.has_key?(:user)
      current_login = session[:user]
    else
      current_login = session[:user] = @current_user.name
    end
    current_login
  end

  def logout
    session.delete(:user)
  end

end