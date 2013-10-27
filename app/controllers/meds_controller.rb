class MedsController < ApplicationController
  before_action :set_med, only: [:show, :edit, :update, :destroy]

  def index
    @meds = Med.all
  end

  def show
  end

  def new
    @med = Med.new
  end

  def edit
  end

  def create
    @med = Med.new(med_params)

    respond_to do |format|
      if @med.save
        format.html { redirect_to @med, notice: 'Med was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @med.update(med_params)
        format.html { redirect_to @med, notice: 'Med was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @med.destroy
    respond_to do |format|
      format.html { redirect_to meds_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_med
      @med = Med.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def med_params
      params.require(:med).permit(:name, :strength)
    end
end
