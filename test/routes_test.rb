require 'scrabble_scorer'
require_relative 'test_helper'

describe ScrabbleScorer::ScrabbleScorer do
  subject { Rack::MockRequest.new(ScrabbleScorer::ScrabbleScorer) }

  describe 'routes' do
    describe 'return proper value' do
      it 'not found ' do
        subject.get('/not_found').status.must_equal(404)
      end
      it 'not found route' do
        subject.get('/score_word/fdsafdsaf/213').status.must_equal(404)
      end
      it 'not found route' do
        subject.get('/score_word/1lalal').status.must_equal(502)
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
  end
end
