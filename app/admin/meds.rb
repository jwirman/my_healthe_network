ActiveAdmin.register Med do
  index do
    column :name
    column :strength
    default_actions
  end

  filter :name

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :strength
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit med: [:name, :strength]
    end
  end

end
