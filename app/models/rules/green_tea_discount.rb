# app/models/rules/green_tea_discount.rb
module Rules
  class GreenTeaDiscount
    def apply(product, quantity)
      return 0 if product.code != "GT1" || quantity < 2

      (quantity / 2.0).floor * product.price
    end
  end
end
