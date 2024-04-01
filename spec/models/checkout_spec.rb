# spec/models/checkout_spec.rb

require "rails_helper"

RSpec.describe Checkout do
  let(:green_tea) { Product.new(code: "GT1", name: "Green Tea", price: 3.11) }
  let(:strawberry) { Product.new(code: "SB1", name: "Strawberry", price: 5.00) }
  let(:coffee) { Product.new(code: "CF1", name: "Coffee", price: 11.23) }

  let(:green_tea_discount) { Rules::GreenTeaDiscount.new }
  let(:strawberry_discount) { Rules::StrawberryDiscount.new }
  let(:coffee_discount) { Rules::CoffeeDiscount.new }

  let(:rules) { [green_tea_discount, strawberry_discount, coffee_discount] }

  subject { Checkout.new(rules) }

  describe "#total" do
    it "applies green tea base discount" do
      subject.scan(green_tea)
      subject.scan(green_tea)
      expect(subject.total).to eq(3.11)
    end

    it "applies green tea discount on more than 2 items" do
      subject.scan(green_tea)
      subject.scan(green_tea)
      subject.scan(green_tea)
      expect(subject.total).to eq(6.22)
    end

    it "applies strawberry discount" do
      subject.scan(strawberry)
      subject.scan(strawberry)
      subject.scan(green_tea)
      subject.scan(strawberry)
      expect(subject.total).to eq(16.61)
    end

    it "applies coffee discount" do
      subject.scan(green_tea)
      subject.scan(coffee)
      subject.scan(strawberry)
      subject.scan(coffee)
      subject.scan(coffee)
      expect(subject.total).to eq(30.57)
    end
  end
end
