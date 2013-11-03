class UsersMedsController < ApplicationController
  before_action :set_users_med, only: [:show, :edit, :update, :destroy]

  def index
    @users_meds = UsersMed.all
  end

  def show
  end

  def new
    @users_med = UsersMed.new
  end

  def edit
  end

  def create
    @users_med = UsersMed.new(users_med_params)

    respond_to do |format|
      if @users_med.save
        format.html { redirect_to @users_med, notice: 'Users med was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @users_med.update(users_med_params)
        format.html { redirect_to @users_med, notice: 'Users med was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @users_med.destroy
    respond_to do |format|
      format.html { redirect_to users_meds_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_med
      @users_med = UsersMed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_med_params
      params.require(:users_med).permit(:freq, :freq_unit, :is_tab, :num_per_dose, :start, :num_doses)
    end
end
