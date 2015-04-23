require 'attr_extras'

module Textualize
  class TwoHundredFour

    pattr_initialize :response

    def transform
      transformed_hash = {}

      transformed_hash[:response_code] = response.keys.first.to_s.to_i

      transformed_hash[:body] = ''

      return transformed_hash
    end

  end
end
