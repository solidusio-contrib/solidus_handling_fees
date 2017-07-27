Deface::Override.new(
  name: 'add_handling_fee_to_admin_order_edit',
  virtual_path: 'spree/admin/shared/_order_summary',
  insert_after: 'dd#ship_total',
  partial: 'spree/admin/handling_fee_admin_order_edit',
  original: 'dff41447805bed7cfa84cc9a52f7b6db1adb7e6a'
)