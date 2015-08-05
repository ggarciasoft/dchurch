class MovementsDetail < ActiveRecord::Base
  belongs_to :asset
  belongs_to :entitytype
  belongs_to :movementtype
  belongs_to :movement
end
