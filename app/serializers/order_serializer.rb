class OrderSerializer < ActiveModel::Serializer
  attributes :id, :product, :quantity, :subtotal, :tax, :total
  belongs_to :product
end
