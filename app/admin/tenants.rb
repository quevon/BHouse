ActiveAdmin.register Tenant do
  permit_params :image,:email, :firstname, :middlename, :lastname,:password,:password_confirmation, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at

  before_action :remove_password_params_if_blank, only: [:update]
  controller do

    def remove_password_params_if_blank
      if params[:tenant][:password].blank? && params[:tenant][:password_confirmation].blank?
        params[:tenant].delete(:password)
        params[:tenant].delete(:password_confirmation)
      end
    end
  end
  filter :email
  filter :approved

  form do |f|
    f.inputs do
        if f.object.new_record?
            f.input :email
            f.input :firstname
            f.input :middlename
            f.input :lastname
            f.input :password
            f.input :password_confirmation
        else
            f.input :image, as: :file
            f.input :email
            f.input :firstname
            f.input :middlename
            f.input :lastname
        end
    end
    f.submit
  end 
 index do
        selectable_column
        id_column
        column :email
        column :firstname
        column :middlename
        column :lastname
        column :created_at
        column :image
        actions
  end

  show do
    attributes_table do
      row :email
      row :image do |ad|
        image_tag ad.image_url if ad.image
      end
      row :firstname
      row :middlename
      row :lastname
    end
  end
end
