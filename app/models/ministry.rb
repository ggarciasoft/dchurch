class Ministry < ActiveRecord::Base
	has_many :members_ministries_positions
	validates :Description, presence: true, length: { maximum: 50, minimum: 5}
end
