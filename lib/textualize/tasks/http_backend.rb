require 'uglifier'
require 'erb'

module Textualize
  class HttpBackend < Thor::Group
    include Thor::Actions

    desc(
      'Creates an angular 1.x module based off ngMockE2E that stubs a backend'
    )

    def create_angular_module
      create_basic_http_backend_file

      append_uglified_hashes
    end

    private

    def create_basic_http_backend_file
      File.open(dist_file, 'w') do |file|
        file.write(
          Uglifier.compile(
            File.read("#{template_directory}/module.js")
          )
        )
      end
    end

    def dist_file
      FileUtils.mkdir_p('dist/angular/backend')

      'dist/angular/backend/fake_http_backend.min.js'
    end

    def http_backend_template(route_hash)
      ERB.new(
        File.read("#{template_directory}/#{route_hash.verb}.js.erb")
      ).result(route_hash.instance_eval { binding })
    end

    def template_directory
      path = File.join(__dir__, '..', 'templates/http_backend')
      File.expand_path(path)
    end

    def append_uglified_hashes
      RouteHashes.hashes.each do |route_hash|
        File.open(dist_file, 'a') do |file|
          file.write(
            Uglifier.compile(
              http_backend_template(route_hash)
            )
          )
        end
      end
    end
  end
end
