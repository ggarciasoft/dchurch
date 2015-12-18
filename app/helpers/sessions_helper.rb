module SessionsHelper
  def log_in(user)
    sessionData = SessionData.new
    sessionData.user_id = user.id
    sessionData.entitymaster_id = user.entitymaster_id
    session[:SessionData] = sessionData
    session[:user_id] = user.id
    session[:entitymaster_id] = user.entitymaster_id
  end

  def current_user
    sessionData = SessionData.new
    sessionData.user_id = session[:user_id]
    sessionData.entitymaster_id = session[:entitymaster_id]
    @current_user ||= sessionData
  end

  def log_out
    session.delete(:SessionData)
    session.delete(:user_id)
    session.delete(:entitymaster_id)
    @current_user = nil
  end

  def logged_in?
    !session[:SessionData].nil?
  end
end
