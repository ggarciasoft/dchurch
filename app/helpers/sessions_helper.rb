module SessionsHelper
  @@session
  def log_in(user)
    sessionData = SessionData.new(user.as_json)
    session[:SessionData] = sessionData.to_json
  end

  def current_user
    sessionDataHash = JSON.parse(session[:SessionData])
    sessionData = SessionData.new(sessionDataHash)
    @current_user ||= sessionData
  end

  def self.current_user
    sessionDataHash = JSON.parse(@@Session[:SessionData])
    sessionData = SessionData.new(sessionDataHash)
    sessionData
  end

  def log_out
    session.delete(:SessionData)
    @current_user = nil
  end

  def logged_in?
    !session[:SessionData].nil?
  end

  def self.set_session(session)
    @@Session = session
  end
end
