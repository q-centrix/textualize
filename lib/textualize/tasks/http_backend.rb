require 'json'
require 'uglifier'
require 'erb'

module Textualize
  class HttpBackend < Thor::Group
    include Thor::Actions

    desc(
      'Creates an angular 1.x module based off ngMockE2E that stubs a backend'
    )

    def create_angular_module
      delete_dist_file_if_exsts

      create_basic_http_backend_file

      append_uglified_hashes
    end

    private

    def make_directory_if_it_does_not_exist(directory)
      FileUtils.mkdir_p(directory) unless File.directory? directory
    end

    def delete_dist_file_if_exsts
      FileUtils.rm dist_file if File.exists? dist_file
    end

    def create_basic_http_backend_file
      File.open(dist_file, 'a') do |file|
        file.write(
          Uglifier.compile(
            Pathname.new("#{template_directory}module.js").read
          )
        )
      end
    end

    def dist_file
      make_directory_if_it_does_not_exist('angular')

      'angular/textualize_http_backend.min.js'
    end

    def http_backend_template(route_hash)
      pathname = Pathname.new("#{template_directory}#{route_hash.verb}.js.erb")
      ERB.new(pathname.read).result(route_hash.instance_eval { binding })
    end

    def template_directory
      __dir__.chomp('tasks') + 'templates/http_backend/'
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
