# frozen_string_literal: true

Spree::OrderUpdater.class_eval do
  module OverrideOrderUpdater
    def recalculate_adjustments
      update_handling
      super
    end

    def update_handling
      [*shipments].each do |item|
        handling_adjustments = item.adjustments.select(&:handling?)

        if Gem.loaded_specs['solidus_core'].version >= Gem::Version.create('2.4')
          handling_adjustments.each(&:recalculate)
        else
          handling_adjustments.each(&:update!)
        end

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
