# frozen_string_literal: true

# Ref: http://benjamintan.io/blog/2014/07/05/overriding-factorygirls-attributes/
FactoryBot.modify do
  # stock location now requires a calculator during testing
  factory :stock_location do
    association(:calculator, factory: :shipping_calculator, strategy: :build)
  end
end
