ActiveAdmin.register Scan do
  index do
    column :user
    column :med
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :user
      f.input :med
      f.input :created_at
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit scan: [:user_id, :med_id, :created_at]
    end
  end

end
