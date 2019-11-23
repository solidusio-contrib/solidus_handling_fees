# frozen_string_literal: true

Spree::Adjustment.class_eval do
  scope :handling, -> { where(source_type: 'Spree::StockLocation') }

  # @return [Boolean] true when this is a handling adjustment (Handling adjustments have a {StockLocation} source)
  def handling?
    source_type == 'Spree::StockLocation'
  end
end
