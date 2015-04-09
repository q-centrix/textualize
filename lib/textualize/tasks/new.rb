module Textualize
  class New < Thor::Group
    include Thor::Actions

    argument :app_name, desc: 'Name for your documentation folder'
    desc('Creates an initial folder structure for writing documentation')

    def self.source_root
      __dir__.chomp('/tasks')
    end

    def create_application_directory
      directory "#{lib_directory}/templates/new/", app_name
    end

    def installation_complete
      puts <<-POST_INSTALL_MESSAGE
♪┏(°.°)┛┗(°.°)┓┗(°.°)┛┏(°.°)┓┏(°.°)┛┗(°.°)┓┗(°.°)┛┏(°.°)┓♪

Thank you for installing textualize, please finish setting up your
project with: `cd #{app_name} && npm install`

In your new folder you can now use the following commands:

* textualize server
* textualize request_specs
* textualize seeds
* textualize factories

Each command depends on gulp being installed.

♪┏(°.°)┛┗(°.°)┓┗(°.°)┛┏(°.°)┓┏(°.°)┛┗(°.°)┓┗(°.°)┛┏(°.°)┓♪
      POST_INSTALL_MESSAGE
    end

    private

    def lib_directory
      __dir__.chomp('/tasks')
    end

  end
end
