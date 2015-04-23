require 'attr_extras'

module Textualize
  class TwoHundred

    pattr_initialize :response

    def transform
      transformed_hash = {}

      transformed_hash[:response_code] = response.keys.first.to_i

      transformed_hash[:body] = fetch_example

      return transformed_hash
    end

    private

    def fetch_example
      response.
        fetch('200').
        fetch('body').
        fetch('application/json').
        fetch('example')
    end

  end
end
