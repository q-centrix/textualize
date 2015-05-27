require 'erb'

module Textualize
  class RequestSpecs < Thor::Group
    include Thor::Actions

    desc(
      'Creates request specs for an api using airborne, a ruby gem'
    )

    def create_airborne_specs
      add_airborne_specs
    end

    private

    def add_airborne_specs
      RouteHashes.filenames_and_hashes.each do |(filename, hashes)|
        request_directory = "dist/#{filename}/spec/requests/"

        FileUtils.mkdir_p(request_directory)

        hashes.each do |route_hash|
          modified_hash = replace_ids_with_interpolated_ruby(route_hash)

          File.open(
            "#{request_directory}#{route_hash.verb}_"\
            "#{route_hash.name}_spec.rb", 'w'
          ) do |file|
            file.write(request_spec_template(modified_hash))
          end
        end
      end
    end

    def request_spec_template(route_hash)
      ERB.new(
        File.read(
          "#{template_directory}#{route_hash.verb}"\
          "_#{non_ro_type(route_hash)}.rb.erb"
        )
      ).result(route_hash.instance_eval { binding })
    end

    def template_directory
      @_directory ||= __dir__.chomp('tasks') + 'templates/request_specs/'
    end

    def non_ro_type(route_hash)
      route_hash.type.gsub(/-ro$/, '')
    end

    def replace_ids_with_interpolated_ruby(route_hash)
      modified_hash = route_hash
      modified_hash.relative_path.gsub!(/({|_id)/, '{' => '#{', '_id' => '.id')
      modified_hash.url.gsub!(/({|_id)/, '{' => '#{', '_id' => '.id')
      modified_hash
    end
  end
end
