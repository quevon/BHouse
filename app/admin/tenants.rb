ActiveAdmin.register Tenant do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at

  before_action :remove_password_params_if_blank, only: [:update]
  controller do

    def remove_password_params_if_blank
      if params[:owner][:password].blank? && params[:user][:password_confirmation].blank?
        params[:owner].delete(:password)
        params[:owner].delete(:password_confirmation)
      end
    end
  end
  filter :email
  filter :approved

  form do |f|
    f.inputs do
        if f.object.new_record?
            f.input :email
            f.input :password
            f.input :password_confirmation
        else
            f.input :email
        end
    end
    f.submit
  end 
 index do
        selectable_column
        id_column
        column :email
        column :created_at
        actions
  end

  show do
    attributes_table do
      row :email
    end
  end
end
