class Movement < ActiveRecord::Base
  belongs_to :asset
  belongs_to :entitytype
  belongs_to :movementtype
end
