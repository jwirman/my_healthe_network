ActiveAdmin.register UsersMed do
  index do
    column :user
    column :med
    column :freq
    column :freq_unit
    column :start
    default_actions
  end

  controller do
    def permitted_params
      params.permit users_med: [:user_id, :med_id, :freq, :freq_unit,
                                :num_per_dose, :start, :first_dose,
                                :second_dose, :third_dose, :fourth_dose,
                                :fifth_dose, :sixth_dose, :window, :num_doses]
    end
  end

end
