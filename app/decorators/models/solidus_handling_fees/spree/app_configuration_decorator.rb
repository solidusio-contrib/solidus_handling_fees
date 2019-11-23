# frozen_string_literal: true

Spree::AppConfiguration.class_eval do
  Rails.application.config.spree.calculators.singleton_class.add_class_set('stock_locations')
  Rails.application.config.spree.calculators.stock_locations = [
    Spree::Calculator::Shipping::FlatPercentItemTotal,
    Spree::Calculator::Shipping::FlatRate,
    Spree::Calculator::Shipping::FlexiRate,
    Spree::Calculator::Shipping::PerItem,
    Spree::Calculator::Shipping::PriceSack
  ]
end
