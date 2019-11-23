# frozen_string_literal: true

Deface::Override.new(
  name: 'add_handling_fee_to_order_details',
  virtual_path: 'spree/shared/_order_details',
  insert_after: 'tfoot#shipment-total',
  partial: 'spree/handling_fee_in_order_details'
)
