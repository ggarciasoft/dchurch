class Movement < ActiveRecord::Base
  has_many :movementsdetails, -> { includes :movementtype }, dependent: :destroy
  accepts_nested_attributes_for :movementsdetails, allow_destroy: true
end
