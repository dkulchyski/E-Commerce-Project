ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity, :image, :category_id
end
