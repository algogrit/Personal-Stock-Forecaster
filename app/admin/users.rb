ActiveAdmin.register User do

  index do
    column :id, :sortable => :last_name do |user|
      link_to user.id, admin_user_path(user)
    end
    column :first_name
    column :last_name
    column :email
    column :reset_password_token
    column :reset_password_sent_at
    column :remember_created_at
    column :current_sign_in_at
    column :last_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_ip
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
    end
    f.buttons
  end
end