ActiveAdmin.register Customer do
  permit_params :first_name, :last_name, :adress, :city, :country, :postal_code, :email
end
