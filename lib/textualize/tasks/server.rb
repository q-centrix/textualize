require 'json'

module Textualize
  class Server < Thor::Group
    include Thor::Actions

    desc(
      'Creates a server directory with json files corresponding to the '\
      "'happy path' responses to a url and http-verb"
    )

    def create_method_files
      RouteHashes.hashes.each do |route_hash|
        next unless route_hash.verb == 'get'
        next if route_hash.body.empty?

        route_directory = "#{dist_dir}#{route_hash.url}"

        FileUtils.mkdir_p(route_directory)

        File.open("#{route_directory}/#{route_hash.verb}.json", 'w') do |file|
          file.write route_hash.body.to_json
        end
      end
    end

    private

    def dist_dir
      FileUtils.mkdir_p('dist/server')

      'dist/server'
    end
  end
end
