class Product < ApplicationRecord
  def is_discounted? # '?' denotes boolean by default so you could write inside this method - price < 100
    if price < 100
      return true
    else
      return false
    end
  end

  def tax
    tax = price * 0.09
      return tax
  end

  def total
    total = tax + price
    return total
  end
end
