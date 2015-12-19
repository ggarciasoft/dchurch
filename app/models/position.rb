class Position < ActiveRecord::Base
  before_create do
    self.created_userid = SessionsHelper.current_user.user_id
  end

  before_update do
    self.updated_userid = SessionsHelper.current_user.user_id
  end
end
