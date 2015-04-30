require_relative '../../spec_helper'

describe Textualize::RouteHashCreator do
  subject { described_class.new(json_from_gulp_task) }

  describe 'GET request' do
    let(:json_from_gulp_task) do
      {
        "baseUri" => "api/v1",
        "resources" => [
          {
            "description" => "Read-only collection of available items",
            "type" => {
              "collection-ro" => {
                "exampleCollection" => "{\n  \"data\": [\n    {\n      \"id\": \"1\",\n      \"type\": \"item\",\n      \"created_at\": \"1430407103\",\n      \"updated_at\": \"1430407180\",\n      \"name\": \"Hamburger\",\n      \"links\": {\n        \"self\": \"https://app.my-awesome-restaurant.com/api/v1/items/1\"\n      }\n    },\n    {\n      \"id\": \"2\",\n      \"type\": \"item\",\n      \"created_at\": \"1430407103\",\n      \"updated_at\": \"1430407180\",\n      \"name\": \"Cheese burger\",\n      \"links\": {\n        \"self\": \"https://app.my-awesome-restaurant.com/api/v1/items/2\"\n      }\n    },\n    {\n      \"id\": \"3\",\n      \"type\": \"item\",\n      \"created_at\": \"1430407103\",\n      \"updated_at\": \"1430407180\",\n      \"name\": \"French Fries\",\n      \"links\": {\n        \"self\": \"https://app.my-awesome-restaurant.com/api/v1/items/3\"\n      }\n    }\n  ]\n}\n",
                "exampleItem" => "{\n  \"data\": {\n    \"id\": \"1\",\n    \"type\": \"item\",\n    \"name\": \"Hamburger\",\n    \"created_at\": \"1430407103\",\n    \"updated_at\": \"1430407180\",\n    \"links\": {\n      \"self\": \"https://app.my-awesome-restaurant.com/api/v1/hamburger/1\"\n    }\n  }\n}\n"
              }
            },
            "relativeUri" => "/items",
            "methods" => [
              {
                "securedBy" => [ { "oauth_2_0" => { "scopes" => [ "staff" ] } } ],
                "responses" => {
                  "200" => {
                    "body" => {
                      "application/json" => {
                        "example" => "{\n  \"data\": [\n    {\n      \"id\": \"1\",\n      \"type\": \"item\",\n      \"created_at\": \"1430407103\",\n      \"updated_at\": \"1430407180\",\n      \"name\": \"Hamburger\",\n      \"links\": {\n        \"self\": \"https://app.my-awesome-restaurant.com/api/v1/items/1\"\n      }\n    },\n    {\n      \"id\": \"2\",\n      \"type\": \"item\",\n      \"created_at\": \"1430407103\",\n      \"updated_at\": \"1430407180\",\n      \"name\": \"Cheese burger\",\n      \"links\": {\n        \"self\": \"https://app.my-awesome-restaurant.com/api/v1/items/2\"\n      }\n    },\n    {\n      \"id\": \"3\",\n      \"type\": \"item\",\n      \"created_at\": \"1430407103\",\n      \"updated_at\": \"1430407180\",\n      \"name\": \"French Fries\",\n      \"links\": {\n        \"self\": \"https://app.my-awesome-restaurant.com/api/v1/items/3\"\n      }\n    }\n  ]\n}\n"
                      }
                    }
                  }
                },
                "protocols" => [ "HTTPS" ],
                "method" => "get",
                "allUriParameters" => []
              }
            ]
          }
        ]
      }
    end

    it 'converts into simpler hash' do
      expect(subject.create_route_hashes.first).to eq Hashie::Mash.new(
        url: 'api/v1/items',
        verb: 'get',
        response_code: 200,
        body: JSON.parse("{\n  \"data\": [\n    {\n      \"id\": \"1\",\n      \"type\": \"item\",\n      \"created_at\": \"1430407103\",\n      \"updated_at\": \"1430407180\",\n      \"name\": \"Hamburger\",\n      \"links\": {\n        \"self\": \"https://app.my-awesome-restaurant.com/api/v1/items/1\"\n      }\n    },\n    {\n      \"id\": \"2\",\n      \"type\": \"item\",\n      \"created_at\": \"1430407103\",\n      \"updated_at\": \"1430407180\",\n      \"name\": \"Cheese burger\",\n      \"links\": {\n        \"self\": \"https://app.my-awesome-restaurant.com/api/v1/items/2\"\n      }\n    },\n    {\n      \"id\": \"3\",\n      \"type\": \"item\",\n      \"created_at\": \"1430407103\",\n      \"updated_at\": \"1430407180\",\n      \"name\": \"French Fries\",\n      \"links\": {\n        \"self\": \"https://app.my-awesome-restaurant.com/api/v1/items/3\"\n      }\n    }\n  ]\n}\n"),
        secured_by: ["staff"],
        name: "items",
        relative_path: "/items",
        type: "collection-ro"
      )
    end
  end
end
