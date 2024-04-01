# app/models/checkout.rb
class Checkout
  attr_reader :cart, :rules

  def initialize(rules)
    @rules = rules
    @cart = Hash.new(0)
  end

  def scan(product)
    @cart[product] += 1
  end

  def total
    total_price = @cart.reduce(0) do |sum, (product, quantity)|
      sum + product.price * quantity - discount_for(product, quantity)
    end
    total_price.round(2)
  end

  private

  def discount_for(product, quantity)
    @rules.sum { |rule| rule.apply(product, quantity) }
  end
end
