# app/models/product.rb
class Product
  attr_reader :code, :name
  attr_accessor :price

  PRODUCT_CODES_WITH_DISCOUNT = %w[GT1 SB1 CF1].freeze

  def initialize(code:, name:, price:)
    @code = code
    @name = name
    @price = price
  end

  def update_price(new_price)
    @price = new_price
  end
end
