# app/models/product.rb
class Product
  attr_reader :code, :name
  attr_accessor :price

  def initialize(code:, name:, price:)
    @code = code
    @name = name
    @price = price
  end

  def update_price(new_price)
    @price = new_price
  end
end
