class Movementsdetail < ActiveRecord::Base
  include ActiveModel::Dirty
  belongs_to :asset
  belongs_to :entitytype
  belongs_to :movementtype
  belongs_to :movement

  def asset_Description
    if (@asset_description.nil?)
      asset.Description
    else
      @asset_description
    end
  end

  def entityType_Description
    if (@entitytype_description.nil?)
      entitytype.Description
    else
      @entitytype_description
    end
  end

  def movementType_Description
    if (@movementtype_description.nil?)
      movementtype.Description
    else
      @movementtype_description
    end
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
