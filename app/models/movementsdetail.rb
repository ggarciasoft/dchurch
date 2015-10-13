class Movementsdetail < ActiveRecord::Base
  include ActiveModel::Dirty
  belongs_to :asset
  belongs_to :entitytype
  belongs_to :movementtype
  belongs_to :movement

  def asset_Description
    @asset_description
  end

  def entityType_Description
    @entitytype_description
  end

  def movementType_Description
    @movementtype_description
  end

  def asset_Description= value
    @asset_description=value
  end

  def entityType_Description= value
    @entitytype_description=value
  end

  def movementType_Description= value
    @movementtype_description=value
  end
end
