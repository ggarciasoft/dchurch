class SessionsController < ApplicationController
  skip_before_filter :validate_security_action, :only => [:new, :create]
  skip_before_filter :set_global_session, :only => [:new, :create]

  def new
  end

  def create
    username = params[:session][:username]
    password = params[:session][:password]
    user = User.find_by(username: username)
    if user && user.authenticate(password)
      log_in user
      redirect_to '/welcome'
    else
      flash.now[:danger] = 'Usuario o contraseña incorrecta.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
