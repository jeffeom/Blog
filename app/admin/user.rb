ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :password, :password_confirmation, :role

index do
    column :email
    column :first_name
    column :last_name
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :role
    actions
end

filter :email
filter :first_name
filter :last_name

form do |f|
    f.inputs "User Details" do
        f.input :email
        f.input :first_name
        f.input :last_name
        f.input :password
        f.input :password_confirmation
        f.input :role, as: :radio, collection: {None: "none", Administrator: "admin"}
    end
    f.actions
end


end
