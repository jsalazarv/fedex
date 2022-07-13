# frozen_string_literal: true

require_relative 'fedex/version'
require 'fedex/fedex_service'
require 'fedex/dhl_service'

module Fedex
  class Error < StandardError; end

  # Your code goes here...
  class Rates
    def self.get(credentials, quote_params)
      #FedexService.get(credentials, quote_params)
      DhlService.get(credentials, quote_params)
    end
  end
end
