module Rules
  class BuyOneGetOneFree
    def apply(product, quantity)
      return 0 unless product.code == "GR1"

      (quantity / 2.0).ceil * product.price
    end
  end
end
