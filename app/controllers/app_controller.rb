class AppController < ApplicationController
  def login
  	if params[:user]
  		log = params[:user][:login]
  		pass = crypter_pass(params[:user][:password])
  		user = User.where(login: log, password: pass).first
  		if user
  			session[:user_id] = user.id
  			session[:user_login] = user.login

  			redirect_to(root_path, notice: "Successfully logged in.")
  		else
  			redirect_to(login_path, notice: "Wrong login or password.")
  		end
  	else
  		#redirection incorrecte
  		#redirect_to(login_path, notice: "debug: params empty, remove the mess after!")
  	end
  end

  def logout
  	session[:user_id] = nil
  	session[:user_login] = nil

    redirect_to(root_path, notice: "Successfully logged out.")
  end
end
