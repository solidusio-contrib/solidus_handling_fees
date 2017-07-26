Spree::OrderUpdater.class_eval do

  module OverrideOrderUpdater

    def recalculate_adjustments
      update_handling
      super
    end

    def update_handling
      [*shipments].each do |item|
        handling_adjustments = item.adjustments.select(&:handling?)

        handling_adjustments.each(&:update!)

        item.handling_total = handling_adjustments.sum(&:amount)
      end
    end

    def update_adjustment_total
      super
      # DD: updated merely for consistency (not used in calculations)
      order.handling_total = shipments.sum(:handling_total)
    end
    
    # This overrides the code from Solidus 2.2 with the more flexible code from Solidus 2.1
    # TODO: remove (because redundant) in Solidus 2.3
    def update_item_totals
      [*line_items, *shipments].each do |item|
        # The cancellation_total isn't persisted anywhere but is included in
        # the adjustment_total
        item.adjustment_total = item.adjustments.
          select(&:eligible?).
          reject(&:included?).
          sum(&:amount)

        if item.changed?
          item.update_columns(
            promo_total:          item.promo_total,
            included_tax_total:   item.included_tax_total,
            additional_tax_total: item.additional_tax_total,
            adjustment_total:     item.adjustment_total,
            updated_at:           Time.current,
          )
        end
      end
    end
  end

  prepend OverrideOrderUpdater

end
