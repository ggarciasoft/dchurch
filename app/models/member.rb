class Member < ActiveRecord::Base
	has_many :memberministrypositions, dependent: :destroy
	accepts_nested_attributes_for :memberministrypositions
	validates :FirstName, presence: true
	validates :LastName, presence: true
	validates :Address, length: { maximum: 100 }
	validates :HomePhone, length: { maximum: 10 }
	validates :CellPhone, length: { maximum: 10 }

	after_validation(on: :update) do
		member = Member.find(id)
		member.memberministrypositions.each { |o|
			x = Memberministryposition.find(o.Id)
			x.destroy
		}
	end
end
