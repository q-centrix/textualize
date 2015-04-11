require 'hashie'

module Textualize
  class Server < Thor::Group
    include Thor::Actions

    desc(
      'Creates a server directory with json files corresponding to the '\
      "'happy path' responses to a url and http-verb"
    )

    def create_method_files
      route_hashes.each do |route_hash|
        next if route_hash.body.empty?

        File.open("#{dist_dir}/#{route_hash.url}/#{route_hash.verb}") do |file|
          file.write route_hash.body
        end
      end
    end

    private

    def route_hashes
      Dir.glob('.tmp/apis/*.json').flat_map do |json_file|
        json = JSON.parse(File.read(json_file))

        RouteHashCreator.new(json).create_route_hashes
      end
    end

    def dist_dir
      FileUtils.mkdir_p('server') unless File.directory? 'server'

      'server'
    end
  end
end

