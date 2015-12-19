module SessionsHelper
  @@Session

  def log_in(user)
    sessionData = SessionData.new
    sessionData.user_id = user.id
    sessionData.entitymaster_id = user.entitymaster_id
    session[:SessionData] = sessionData.to_json
  end

  def current_user
    sessionData = SessionData.new
    sessionDataHash = JSON.parse(session[:SessionData])
    sessionData.user_id = sessionDataHash["user_id"]
    sessionData.entitymaster_id = sessionDataHash["entitymaster_id"]
    @current_user ||= sessionData
  end

  def self.current_user
    sessionData = SessionData.new
    sessionDataHash = JSON.parse(SessionData.session[:SessionData])
    sessionData.user_id = sessionDataHash["user_id"]
    sessionData.entitymaster_id = sessionDataHash["entitymaster_id"]
    @current_user ||= sessionData
  end

  def log_out
    session.delete(:SessionData)
    @current_user = nil
  end

  def logged_in?
    !session[:SessionData].nil?
  end
end
