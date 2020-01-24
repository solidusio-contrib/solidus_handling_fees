# frozen_string_literal: true

warn \
  'DEPRECATED REQUIRE: Please update your refs from "spree_handling_fees" ' \
  'to "solidus_handling_fees".', uplevel: 1
require 'solidus_handling_fees'
