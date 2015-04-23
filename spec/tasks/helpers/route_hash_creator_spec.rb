require_relative '../../spec_helper'

describe Textualize::RouteHashCreator do
  subject { described_class.new(json_from_gulp_task) }

  describe 'GET request' do
    let(:json_from_gulp_task) do
      {
        "baseUri" => "api/v1",
        "resources" => [
          {
            "description" => "A read-only facility record",
            "type" => {
              "item-ro" => {
                "exampleItem" => "{\n  \"facility\" : {\n    \"id\": 1,\n    \"name\": \"Large Facility\",\n    \n  }\n}\n"
              }
            },
            "relativeUri" => "/facility",
            "methods" => [
              {
                "responses" => {
                  "200" => {
                    "body" => {
                      "application/json" => {
                        "example" => "{\n  \"facility\" : {\n    \"id\": 1,\n    \"name\": \"Large Facility\",\n    \n  }\n}\n"
                      }
                    }
                  }
                },
                "protocols" => [
                  "HTTPS"
                ],
                "method" => "get",
                "allUriParameters" => []
              }
            ],
            "relativeUriPathSegments" => [
              "facility"
            ],
            "parentUrl" => "",
            "uniqueId" => "_facility",
            "allUriParameters" => []
          }
        ]
      }
    end

    it 'converts into simpler hash' do
      expect(subject.create_route_hashes).to eq [
        Hashie::Mash.new(
          url: 'api/v1/facility',
          verb: 'get',
          response_code: 200,
          body: "{\n  \"facility\" : {\n    \"id\": 1,\n    \"name\": \"Large Facility\",\n    \n  }\n}\n"
        )
      ]
    end
  end
end
