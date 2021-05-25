class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :category_products
  has_many :categories, through: :category_products

  # VALIDATIONS --------------------------------------------

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {greater_than: 0 }
  validates :description, length: { maximum: 500 }
  validates :inventory, numericality: { greater_than_or_equal_to: 0 }
  # validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg|gif)$}i, :message => "must have a valid file type", :multiline => true

  # VALIDATIONS --------------------------------------------


  def is_discounted? # '?' denotes boolean by default so you could write inside this method - "price < 100"
    if price <= 100
      return true
    else
      return false
    end
  end

  def tax
    tax = price * 0.09 # could simply write "price * 0.09"
    return tax.round(2)
  end

  def total # could simply write "price + tax" 
    total = tax + price
    return total
  end
end
