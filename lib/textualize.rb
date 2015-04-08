require "textualize/version"

module Textualize
  class Textualize < Thor
    register(New, 'new', 'new', 'create a new documentation project')

    register(
      Server,
      'server',
      'server',
      'create a folder structure of json responses'
    )

    register(
      RequestSpecs,
      'request_specs',
      'request_specs',
      'create request specs from your raml files'
    )

    register(
      Seeds,
      'seeds',
      'seeds',
      'create a db:seed from your raml files'
    )

    register(
      Factories,
      'factories',
      'factories',
      'create angular factories from your raml files'
    )
  end
end
