ActiveAdmin.register Med do
  index do
    column :generic_name
    column :brand_name
    column :strength
    default_actions
  end

  filter :name

  form do |f|
    f.inputs "Details" do
      f.input :generic_name
      f.input :brand_name
      f.input :strength
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit med: [:generic_name, :brand_name, :strength]
    end
  end

end
