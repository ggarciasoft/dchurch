class Movement < ActiveRecord::Base
  has_many :movementsdetails, dependent: :destroy
  accepts_nested_attributes_for :movementsdetails, allow_destroy: true
  validates :MovementDate, presence: true
  validates :Comments, length: {maximum: 500}

  after_validation(on: :update) do
    Movementsdetail.delete_all(:Movement_id => id)
  end
end
