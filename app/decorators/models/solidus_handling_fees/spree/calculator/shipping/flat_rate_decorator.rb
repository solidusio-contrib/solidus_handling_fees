# frozen_string_literal: true

Spree::Calculator::Shipping::FlatRate.class_eval do
  def compute_shipment(_shipment)
    preferred_amount
  end
end
