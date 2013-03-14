class User < ActiveRecord::Base
  def self.authenticate(inputted_email, inputted_password, session)
    user = User.find_by_email(inputted_email)
    return false if user == nil
    if user.email == inputted_email
      if user.password == inputted_password
        session[:user] = user.name
      else
        return false
      end
    end
    true
  end
end