# README

#### Prerequisites

The setup steps expect following tools installed on the system.

- Github
- Ruby "3.0.0"
- Rails "7.0.8.1"

##### 1. Check out the repository

```bash
git clone git@github.com:eprusakov/cash_register.git
```

##### 2. Install gems

```bash
bundle install
```

##### 3. Start the Rails console

You can start the rails console using the command given below.

```ruby
bundle exec rails c
```

And now you can use application inside the rails console


#### Usage

##### 1. Create rules' set from available rules

```ruby
pricing_rules = [Rules::GreenTeaDiscount.new, Rules::StrawberryDiscount.new, Rules::CoffeeDiscount.new]
```
###### Available rules
1) Rule makes each 2nd green tea free to buy
> Rules::GreenTeaDiscount
2) Rule makes each strawberry to cost 4.50 if there are 3 or more strawberiies in a cart
> Rules::StrawberryDiscount
3) Rule drops all coffee prices to 2/3 from the initial cost if there 3 or more coffees in a cart
> Rules::CoffeeDiscount

##### 2. Create products' preset using any values you want, but keep keys

```ruby
green_tea = Product.new(code: "GT1", name: "Green Tea", price: 3.11)
```
###### Available product's with discount
1) Green tea
> Product.new(code: "GT1", name: "Green Tea", price: 3.11)
2) Strawberry
> Product.new(code: "SB1", name: "Strawberry", price: 5.00)
3) Coffee
> Product.new(code: "CF1", name: "Coffee", price: 11.23)

##### 3. Create cart's instance

```ruby
checkout = Checkout.new(pricing_rules)
```

##### 4. Scan any amount of products


```ruby
checkout.scan(green_tea)
checkout.scan(*smth_other*)
```

##### 5. Check all cart items with quantity

```ruby
checkout.cart
```

##### 6. Check total price of current cart

```ruby
checkout.total
```
