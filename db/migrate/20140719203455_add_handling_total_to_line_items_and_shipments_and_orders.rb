# frozen_string_literal: true

class AddHandlingTotalToLineItemsAndShipmentsAndOrders < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_line_items, :handling_total, :decimal, precision: 10, scale: 2, default: 0.0
    add_column :spree_shipments, :handling_total, :decimal, precision: 10, scale: 2, default: 0.0
    add_column :spree_orders, :handling_total, :decimal, precision: 10, scale: 2, default: 0.0
  end
end
