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
  end

  prepend OverrideOrderUpdater

end
