require 'erb'

module Textualize
  class HttpBackend < Thor::Group
    include Thor::Actions

    desc(
      'Creates an angular 1.x module based off ngMockE2E that stubs a backend'
    )

    def create_backend_angular_modules
      RouteHashes.filenames_and_hashes.each do |(filename, hashes)|
        puts hashes
        puts filename

        FileUtils.mkdir_p("dist/#{filename}/angular/backend")

        File.open(dist_file(filename), 'w') do |file|
          file.write(
            File.read("#{template_directory}/module.js")
          )
        end

        hashes.each do |route_hash|
          modified_hash = replace_sample_id_with_1(route_hash)
          File.open(dist_file(filename), 'a') do |file|
            file.write(
              http_backend_template(modified_hash)
            )
          end
        end
      end
    end

    private

    def dist_file(filename)
      "dist/#{filename}/angular/backend/fake_http_backend.min.js"
    end

    def template_directory
      path = File.join(__dir__, '..', 'templates/http_backend')
      File.expand_path(path)
    end

    def replace_sample_id_with_1(route_hash)
      route_hash.relative_path.gsub!(/{.*}/, '1')
      route_hash.url.gsub!(/{.*}/, '1')
      return route_hash
    end

    def http_backend_template(route_hash)
      ERB.new(
        File.read("#{template_directory}/#{route_hash.verb}.js.erb")
      ).result(route_hash.instance_eval { binding })
    end
  end
end
