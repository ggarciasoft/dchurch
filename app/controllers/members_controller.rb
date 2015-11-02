require 'json'
require 'securerandom'
class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_detail_data, only: [:new, :edit]
  before_action :set_directory, only: [:create, :update, :savePhoto]
  skip_before_filter :verify_authenticity_token, :only => [:savePhoto]

  def set_directory
    @tempDirectory = File.dirname(Rails.root.join('app', 'assets', 'temp', 'photo'))
    @photoDirectory = File.dirname(Rails.root.join('app', 'assets', 'images', 'photos', 'photo'))
  end

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    respond_to do |format|
      if @member.save
        if (@member.Photo != '')
          if (File.exist?(@member.PhotoPath))
            File.open(@photoDirectory + '/' + @member.Photo, 'wb') { |f| f.write(File.open(@member.PhotoPath, 'r').read) }
          end
        end
        if params[:additionalAction] == 'saveandnew'
          format.html { redirect_to ({action: 'new', id: @member.id}), notice: 'Miembro creado.' }
        else
          format.html { redirect_to @member, notice: 'Miembro creado.' }
        end
      else
        set_detail_data
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    newMember = Member.new(member_params)
    oldPhoto = @member.Photo
    oldPhotoPath = @member.PhotoPath
    respond_to do |format|
      if @member.update(member_params)
        if (newMember.Photo != '' && newMember.Photo != oldPhoto)
          if (File.exist?(newMember.PhotoPath))
            File.open(@photoDirectory + '/' + newMember.Photo, 'wb') { |f| f.write(File.open(newMember.PhotoPath, 'r').read) }
            if (oldPhotoPath)
              File.delete(oldPhotoPath)
            end
          end
        end
        if params[:additionalAction] == 'saveandnew'
          format.html { redirect_to ({action: 'new', id: @member.id}), notice: 'Miembro actualizado.' }
        else
          format.html { redirect_to @member, notice: 'Miembro actualizado.' }
        end
      else
        set_detail_data
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    if (@member.Photo != '' && File.exist?(@member.PhotoPath))
      File.delete(@member.PhotoPaths)
    end
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def savePhoto
    photo = params[:photo]
    filename = SecureRandom.uuid + '~~' + photo.original_filename
    while (File.exist?(@tempDirectory + '/' + filename) && File.exist?(@photoDirectory + '/' + filename))
      filename = SecureRandom.uuid + '~~' + photo.original_filename
    end

    File.open(@tempDirectory + '/' + filename, 'wb') { |f| f.write(photo.read) }
    render plain: filename
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_member
    if (@photoDirectory == nil)
      set_directory()
    end
    @member = Member.find(params[:id])
    if (@member != nil && @member.Photo != '')
      @member.PhotoPath = '/assets/' + @member.Photo
      if (!File.exist?(@tempDirectory + '/' + @member.Photo))
        File.open(@tempDirectory + '/' + @member.Photo, 'wb') { |f| f.write(File.open(@photoDirectory + '/' + @member.Photo).read) }
      end
    end
  end

  def set_detail_data
    @ministries = Ministry.all.collect { |m| [m.Description, m.Id] }
    @positions = Position.all.collect { |m| [m.Description, m.Id] }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def member_params
    params.require(:member).permit(:Id, :FirstName, :LastName, :BirthDate, :ConvertionDate, :Address, :HomePhone, :CellPhone, :BaptismDate, :Active, :Photo, :PhotoPath, memberministrypositions_attributes: [:Id, :ministry_id, :position_id])
  end
end
