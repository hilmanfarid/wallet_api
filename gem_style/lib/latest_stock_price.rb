# frozen_string_literal: true

require_relative "latest_stock_price/version"

module GemStyle
  # Price All
  class LatestStockPrice
    class << self
      def price_all
        require "uri"
        require "net/http"

        url = URI("https://latest-stock-price.p.rapidapi.com/any")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = "09140a6338msh596f5be90c3a3aep1df76ejsna06a688a5e2e"
        request["x-rapidapi-host"] = "latest-stock-price.p.rapidapi.com"

        response = http.request(request)
        puts response.read_body
      end

    end
  end
  # Your code goes here...
end
