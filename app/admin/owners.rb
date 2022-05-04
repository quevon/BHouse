ActiveAdmin.register Owner do
  permit_params :email,  :firstname, :middlename, :lastname,:password,:password_confirmation,:encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :approved, :confirmation_token,:confirmed_at,:confirmation_sent_at,:unconfirmed_email

  before_action :remove_password_params_if_blank, only: [:update]
  controller do

    def remove_password_params_if_blank
      if params[:owner][:password].blank? && params[:owner][:password_confirmation].blank?
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
            f.input :firstname
            f.input :middlename
            f.input :lastname
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
        column :email
        column :firstname
        column :middlename
        column :lastname
        column :created_at
        column :approved?
        column "Status" do |owner|
          if owner.approved == false
            link_to 'Inactive', active_owner_path(owner), method: :patch, data: {confirm: "Do you want to activate #{owner.email}?"},:class => 'link', style: "color: red;"
          else 
            link_to 'Active', inactive_owner_path(owner), method: :patch, data: {confirm: "Do you want to deactivate #{owner.email}?"},:class => 'link', style: "color: green;"
          end
        end
        actions
  end


  show do
    attributes_table do
      row :email
      row :firstname
      row :middlename
      row :lastname
      row :approved?
    end
  end
end
