require_relative '../spec_helper'

describe Textualize::TwoHundredFour do
  subject { described_class.new(response) }

  describe 'converts a 204 request with a body into a common hash' do
    let(:response) do
      {
        '204' => {
          'description' => 'Success (no body)'
        }
      }
    end

    specify do
      expect(subject.transform).to eq(
        {
          response_code: 204
        }
      )
    end
  end
end
