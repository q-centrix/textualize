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

    register(
      ::Textualize::HttpBackend,
      'http_backend',
      'http_backend',
      'create an Angular 1.x module for stubbing backend responses'
    )

    register(
      ::Textualize::RequestSpecs,
      'request_specs',
      'request_specs',
      'create requset specs using airborne'
    )
  end
end
