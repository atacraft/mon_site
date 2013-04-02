class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :connected, :crypter_pass, :current_user, :redirection

  def redirection
    if !connected
      redirect_to(root_path, notice: "You must log in to access this area.")
    end
  end

  def crypter_pass(password)
    return Digest::MD5.hexdigest("#{password}")
  end

  def connected
  	if session[:user_id]
  		true
  	else
  		false
  	end
  end

end
