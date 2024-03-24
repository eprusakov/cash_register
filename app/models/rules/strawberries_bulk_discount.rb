# app/models/rules/strawberries_bulk_discount.rb
module Rules
  class StrawberriesBulkDiscount
    DISCOUNTED_PRICE = 4.50
    MINIMUM_QUANTITY = 3

    def apply(product, quantity)
      return 0 unless product.code == "SR1"

      quantity >= MINIMUM_QUANTITY ? quantity * (product.price - DISCOUNTED_PRICE) : 0
    end
  end
end
