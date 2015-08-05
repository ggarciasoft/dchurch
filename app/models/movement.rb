class Movement < ActiveRecord::Base
  has_many :movementsdetails, dependent: :destroy
  accepts_nested_attributes_for :movementsdetails
end
