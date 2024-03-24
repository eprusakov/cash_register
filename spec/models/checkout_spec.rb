# spec/models/checkout_spec.rb

require "rails_helper"

RSpec.describe Checkout do
  let(:green_tea) { Product.new(code: "GR1", name: "Green Tea", price: 3.11) }
  let(:strawberries) { Product.new(code: "SR1", name: "Strawberries", price: 5.00) }
  let(:coffee) { Product.new(code: "CF1", name: "Coffee", price: 11.23) }

  let(:buy_one_get_one_free) { Rules::BuyOneGetOneFree.new }
  let(:strawberries_bulk_discount) { Rules::StrawberriesBulkDiscount.new }
  let(:coffee_bulk_discount) { Rules::CoffeeBulkDiscount.new }

  let(:rules) { [buy_one_get_one_free, strawberries_bulk_discount, coffee_bulk_discount] }

  subject { Checkout.new(rules) }

  describe "#total" do
    it "calculates the total price correctly" do
      subject.scan(green_tea)
      subject.scan(green_tea)
      expect(subject.total).to eq(3.11)

      subject.scan(strawberries)
      subject.scan(strawberries)
      subject.scan(green_tea)
      subject.scan(strawberries)
      expect(subject.total).to eq(16.61)

      subject.scan(green_tea)
      subject.scan(coffee)
      subject.scan(strawberries)
      subject.scan(coffee)
      subject.scan(coffee)
      expect(subject.total).to eq(30.57)
    end
  end
end
