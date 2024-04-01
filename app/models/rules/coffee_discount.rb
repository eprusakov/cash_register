# app/models/rules/coffee_discount.rb
module Rules
  class CoffeeDiscount
    DISCOUNT_PERCENTAGE = 2.0 / 3.0
    MINIMUM_QUANTITY = 3

    def apply(product, quantity)
      return 0 unless product.code == "CF1"

      if quantity >= MINIMUM_QUANTITY
        total_price = product.price * quantity
        discounted_price = total_price * DISCOUNT_PERCENTAGE
        total_price - discounted_price
      else
        0
      end
    end
  end
end
