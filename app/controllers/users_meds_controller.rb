class UsersMedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_users_med, only: [:show, :edit, :update, :destroy]

  def index
    @users_meds = current_user.users_meds
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
    @users_med.user_id = current_user.id

    respond_to do |format|
      if @users_med.save
        format.html { redirect_to users_meds_path, notice: "#{current_user.first_name}'s #{@users_med.med} was successfully added." }
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

  # ajax call
  def frequency_units
    @units = Med.units_from_freq(params[:freq])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_med
      @users_med = UsersMed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_med_params
      params.require(:users_med).permit(:med_id, :freq, :freq_unit, :num_per_dose, :start, :num_doses, :first_dose, :second_dose, :third_dose, :fourth_dose, :fifth_dose, :sixth_dose, :window)
    end
end
