require 'erb'

module Textualize
  class RequestSpecs < Thor::Group
    include Thor::Actions

    desc(
      'Creates request specs for an api using airborne, a ruby gem'
    )

    def create_airborne_specs
      empty_airborne_directory

      add_airborne_specs
    end

    private

    def empty_airborne_directory
      if File.directory? 'request_specs'
        FileUtils.rm_rf(Dir.glob('request_specs/**/*'))
      else
        FileUtils.mkdir_p('request_specs')
      end
    end

    def add_airborne_specs
      RouteHashes.hashes.each do |route_hash|
        File.open(
          "request_specs/#{route_hash.verb}_#{route_hash.name}_spec.rb", 'a'
        ) do |file|
          file.write(
            request_spec_template(route_hash)
          )
        end
      end
    end

    def request_spec_template(route_hash)
      pathname = Pathname.new(
        "#{template_directory}#{route_hash.verb}_#{route_hash.type}.rb.erb"
      )
      ERB.new(pathname.read).result(route_hash.instance_eval { binding })
    end

    def template_directory
      __dir__.chomp('tasks') + 'templates/request_specs/'
    end
  end
end
