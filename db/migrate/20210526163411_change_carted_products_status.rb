class ChangeCartedProductsStatus < ActiveRecord::Migration[6.1]
  def change
    change_column :carted_products, :status, :string, default: "carted"
  end
end
