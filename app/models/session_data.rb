class SessionData
  ROLES_ADMIN = 1

  attr_accessor :id, :entitymaster_id, :role_id

  def initialize(sessionHash)
    self.id = sessionHash["id"]
    self.entitymaster_id = sessionHash["entitymaster_id"]
    self.role_id = sessionHash["role_id"]
  end
end