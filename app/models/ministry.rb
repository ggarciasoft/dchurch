class Ministry < ActiveRecord::Base
	has_many :memberministrypositions
	validates :Description, presence: true, length: { maximum: 50, minimum: 5}

	before_create do
		self.created_userid = SessionsHelper.current_user.user_id
	end

	before_update do
		self.updated_userid = SessionsHelper.current_user.user_id
	end
end
