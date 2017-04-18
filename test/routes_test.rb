require 'scrabble_scorer'
require_relative 'test_helper'

describe ScrabbleScorer::Core do
  subject { Rack::MockRequest.new(ScrabbleScorer::Core) }

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
    end
    describe 'wrong value' do
      it 'score_word bad request' do
        subject.get('/score_word/fdsafdsaf/213').status.must_equal(502)
      end
    end
  end
end
