require_relative '../spec_helper'

describe Textualize::TwoHundred do
  subject { described_class.new(response: response) }

  describe 'converts a 200 request with a body into a common hash' do
    let(:response) do
      {
        '200': {
          'body': {
            'application/json': {
              'example': '{\n  "arbitrary": \n "json" }\n'
            }
          }
        }
      }
    end

    specify do
      expect(subject.transform).to eq(
        {
          response_code: 200,
          body: '{\n  "arbitrary": \n "json" }\n'
        }
      )
    end
  end
end
