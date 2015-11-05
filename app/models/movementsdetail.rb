class Movementsdetail < ActiveRecord::Base
  include ActiveModel::Dirty
  belongs_to :asset
  belongs_to :entitytype
  belongs_to :movementtype
  belongs_to :movement
  validates :movement_id, presence: true
  validates :movementtype_id, presence: true
  validates :entitytype_id, presence: true
  validates :entityReference, presence: true, length: {maximum: 200}
  validates :asset_id, presence: true
  validates :assetQuantity, presence: true
  validates :Comment, length: {maximum: 50}

  def asset_Description
    if (@asset_description.nil? && !asset.nil?)
      @asset_description = asset.Description
    end
    @asset_description
  end

  def entityType_Description
    if (@entitytype_description.nil? && !entitytype.nil?)
      @entitytype_description = entitytype.Description
    end
    @entitytype_description
  end

  def movementType_Description
    if (@movementtype_description.nil? && !movementtype.nil?)
      @movementtype_description = movementtype.Description
    end
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
