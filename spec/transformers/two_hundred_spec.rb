require 'spec_helper'

describe Textualize::Transformers::TwoHundred do
  subject { described_class.new(response: response) }

  it 'converts a 200 request with a body into a common struct' do
    let(:response) do
      {
        "200": {
          "body": {
            "application/json": {
              "example": "{\n  \"provider\": {\n    \"id\": 2,\n    \"first_name\": \"Doctor\",\n    \"last_name\": \"Nick\"\n  }\n}\n"
            }
          }
        }
      }
    end

    expect(subject.transform).to eq {
      response_code: 200,
      body: "{\n  \"provider\": {\n    \"id\": 2,\n    \"first_name\": \"Doctor\",\n    \"last_name\": \"Nick\"\n  }\n}\n"
    }
  end
end
