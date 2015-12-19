class Member < ActiveRecord::Base
	has_many :memberministrypositions, dependent: :destroy
	accepts_nested_attributes_for :memberministrypositions
	validates :FirstName, presence: true
	validates :LastName, presence: true
	validates :Address, length: { maximum: 100 }
	validates :HomePhone, length: { maximum: 10 }
	validates :CellPhone, length: { maximum: 10 }

  attr_accessor :PhotoPath

	after_validation(on: :update) do
		member = Member.find(id)
		member.memberministrypositions.each { |o|
			x = Memberministryposition.find(o.Id)
			x.destroy
		}
	end

  before_create do
    self.created_userid = SessionsHelper.current_user.user_id
    self.entitymaster_id = SessionsHelper.current_user.entitymaster_id
  end

  before_update do
    self.updated_userid = SessionsHelper.current_user.user_id
  end
end
