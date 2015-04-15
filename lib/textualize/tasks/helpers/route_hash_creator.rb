require 'attr_extras'
require 'hashie'

module Textualize
  class RouteHashCreator

    pattr_initialize :json_from_gulp_task

    def create_route_hashes
      json_from_gulp_task.fetch('resources').flat_map do |resource|
        create_method_hashes(resource)
      end
    end

    private

    def create_method_hashes(resource, relativeUri=nil)
      relative_path = if relativeUri
                        relativeUri + resource.fetch('relativeUri')
                      else
                        resource.fetch('relativeUri')
                      end

      method_hashes = []
      method_hashes += resource.fetch('methods').map do |method|
        method_hash = Hashie::Mash.new
        method_hash.verb          = method.fetch('method')
        method_hash.url           = base_path + relative_path
        method_hash.relative_path = relative_path
        method_hash.type          = resource.fetch('type').keys.first
        method_hash.name          = relative_path.split('/').last.gsub(
          /{|}|_id/, ''
        )
        method_hash.merge!(transformed_response(method))
      end

      if resource.has_key? 'resources'
        resource.fetch('resources').each do |nested_resource|
          method_hashes += create_method_hashes(nested_resource, relative_path)
        end
      end

      return method_hashes
    end

    def base_path
      URI(json_from_gulp_task.fetch('baseUri')).path
    end

    def transformed_response(method_hash)
      response = method_hash.fetch('responses')

      case response.keys.first
      when '200' then ::Textualize::TwoHundred.new(response).transform
      when '204' then ::Textualize::TwoHundredFour.new(response).transform
      end
    end

  end
end
