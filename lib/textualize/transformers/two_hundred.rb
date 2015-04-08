module Textualize
  class TwoHundred

    def initialize(response: response)
      @response = response
    end

    def transform
      transformed_hash = {}

      transformed_hash[:response_code] = @response.keys.first.to_s.to_i

      transformed_hash[:body] = fetch_example

      return transformed_hash
    end

    private

    def fetch_example
      @response.
        fetch(:'200').
        fetch(:'body').
        fetch(:'application/json').
        fetch(:'example')
    end

  end
end
