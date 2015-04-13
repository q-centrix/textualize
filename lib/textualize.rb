Dir["#{__dir__}/**/*.rb"].each { |file| require file }

module Textualize
  class Textualize < Thor
    register(
      ::Textualize::New,
      'new',
      'new',
      'create a new documentation project'
    )

    register(
      ::Textualize::Server,
      'server',
      'server',
      'create a folder structure of json responses'
    )
  end
end
