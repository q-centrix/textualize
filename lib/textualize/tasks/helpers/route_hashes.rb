module Textualize
  class RouteHashes
    class << self
      def hashes
        fail 'run gulp first' if raml_json_files.empty?

        raml_json_files.flat_map do |json_file|
          json = JSON.parse(File.read(json_file))

          RouteHashCreator.new(json).create_route_hashes
        end
      end

      private

      def raml_json_files
        Dir.glob('.tmp/apis/*.json')
      end
    end
  end
end
