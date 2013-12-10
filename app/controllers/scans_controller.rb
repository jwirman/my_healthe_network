class ScansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_scan, only: [:show, :edit, :update, :destroy]

  def index
    @scans = current_user.scans
  end

  def show
  end

  def new
    @scan = Scan.new
  end

  def edit
  end

  def create
    @scan = Scan.new(scan_params)
    @scan.user_id = current_user.id

    respond_to do |format|
      if @scan.save
        format.html { redirect_to @scan, notice: 'Scan was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @scan.update(scan_params)
        format.html { redirect_to @scan, notice: 'Scan was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @scan.destroy
    respond_to do |format|
      format.html { redirect_to scans_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scan
      @scan = Scan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scan_params
      params.require(:scan).permit(:user_id, :med_id)
    end
end
