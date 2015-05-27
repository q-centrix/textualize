module Textualize
  class RouteHashes
    class << self
      def filenames_and_hashes
        fail 'run gulp first' if raml_json_files.empty?

        raml_json_files.map do |json_file|
          json = JSON.parse(File.read(json_file))

          [
            File.basename(json_file, '.*'),
            RouteHashCreator.new(json).create_route_hashes
          ]
        end
      end

      private

      def raml_json_files
        Dir.glob('.tmp/apis/*.json')
      end
    end
  end
end
