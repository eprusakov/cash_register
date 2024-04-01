# app/models/rules/strawberry_discount.rb
module Rules
  class StrawberryDiscount
    DISCOUNTED_PRICE = 4.50
    MINIMUM_QUANTITY = 3

    def apply(product, quantity)
      return 0 unless product.code == "SB1"

      quantity >= MINIMUM_QUANTITY ? quantity * (product.price - DISCOUNTED_PRICE) : 0
    end
  end
end
