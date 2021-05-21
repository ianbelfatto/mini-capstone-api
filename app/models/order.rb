class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
end

# def subtotal
#   order.subtotal
# end

# def tax
#   order.tax
# end

# def total
#   order.total
# end


# Create Orders Controller
# Add Create Method with product_id, quantity, and user_id: current_user.id
# Add Happy/Sad Paths for if the user is logged in or not
# Render JSON for successful order else render JSON with order.errors.full_messages, status :unauthorized
# Create Orders serializer, with methods for math, add methods to serializer
# Create POST route pointing towards create method
# In Multipart form add parameters for product_id, quantity (user_id should automattically fill from current_user.id)
# Fill in product_id and quantity
# Add Authorization and Bearer with user jwt
# send
# Create Index to see all User's orders