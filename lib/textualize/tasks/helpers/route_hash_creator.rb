module Textualize
  class RouteHashCreator

    pattr_initialize :json_from_gulp_task

    def create_route_hashes
      json_from_gulp_task.fetch(:'resources').flat_map do |resource|
        create_method_hashes(resource)
      end
    end

    private

    def transformed_response(method_hash)
      response = method_hash.fetch(:responses)

      case response.keys.first
      when :'200' then ::Textualize::TwoHundred.new(response).transform
      when :'204' then ::Textualize::TwoHundredFour.new(response).transform
      end
    end

    def create_method_hashes(resource, relativeUri=nil, method_hashes=[])
      relative_path = if relativeUri
                        relativeUri + resource.fetch(:relativeUri)
                      else
                        resource.fetch(:relativeUri)
                      end

      method_hashes = method_hashes + resource.fetch(:'methods').map do |method|
        method_hash = {}
        method_hash[:verb] = method.fetch(:method)
        method_hash[:url] = base_path + relative_path
        method_hash.merge!(transformed_response(method))
      end

      return method_hashes unless resource.has_key? :resources

      resource.resources.each do |resource|
        create_method_files(resource, relative_path, method_hashes)
      end
    end

    def base_path
      URI(json_from_gulp_task.fetch(:'baseUri')).path
    end
  end
end
