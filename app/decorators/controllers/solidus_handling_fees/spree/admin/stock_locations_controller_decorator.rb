# frozen_string_literal: true

module Spree
  module Admin
    StockLocationsController.class_eval do
      before_action :load_data, except: [:index]

      def load_data
        @calculators = Rails.application.config.spree.calculators.stock_locations
      end
    end
  end
end
