class Memberministryposition < ActiveRecord::Base
	belongs_to :member
	belongs_to :position
	belongs_to :ministry
end
