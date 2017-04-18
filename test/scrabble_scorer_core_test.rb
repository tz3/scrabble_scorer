require 'rack'
require 'scrabble_scorer_core'
require 'minitest/autorun'
require 'json'

describe ScrabbleScorerCore do
  subject { Rack::MockRequest.new(ScrabbleScorerCore) }

  describe 'routes' do
    describe 'return proper value' do
      it 'not found ' do
        subject.get('/not_found').status.must_equal(404)
      end

      it 'root' do
        subject.get('/').status.must_equal(200)
      end

      it 'root without slash' do
        subject.get('').status.must_equal(200)
      end

      it 'score_word' do
        subject.get('/score_word/test').status.must_equal(200)
      end

      it 'score_word response' do
        expected_value = { word: 'test', valid: false, score: 4 }.to_json
        subject.get('/score_word/test').body.must_equal(expected_value)
      end

      it 'score_word bad request' do
        subject.get('/score_word/fdsafdsaf/213').status.must_equal(502)
      end
    end
  end
end
