require_relative '../spec_helper'
require LIB_FOLDER + '/transformers/two_hundred'

describe Textualize::TwoHundred do
  subject { described_class.new(response: response) }

  describe 'converts a 200 request with a body into a common struct' do
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
