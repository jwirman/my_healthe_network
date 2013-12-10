ActiveAdmin.register UsersMed do
  index do
    column :user
    column :med
    column :freq
    column :freq_unit
    column :start
    default_actions
  end

end
