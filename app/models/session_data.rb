class SessionData
  attr_accessor :user_id, :entitymaster_id

  def self.set_session(session)
    @@Session = session
  end

  def self.session
    @@Session
  end
end