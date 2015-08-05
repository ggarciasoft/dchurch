class Ministry < ActiveRecord::Base
	has_many :memberministrypositions
	validates :Description, presence: true, length: { maximum: 50, minimum: 5}
end
