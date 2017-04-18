require 'rack'
require 'scrabble_scorer'
require 'minitest/autorun'
require 'json'
ENV['RACK_ENV'] = 'test'

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
  end

  describe 'score_word' do
    before do
      @d1 = ScrabbleScorer::Word.create('hello')
    end

    after do
      @d1.destroy
    end
    it 'score_word response without words' do
      expected_value = { word: 'test', valid: false }.to_json
      subject.get('/score_word/test').body.must_equal(expected_value)
    end

    it 'score_word response' do
      expected_value = { word: 'hello', valid: true, score: 8 }.to_json
      subject.get('/score_word/hello').body.must_equal(expected_value)
    end

    it 'score_word bad request' do
      subject.get('/score_word/fdsafdsaf/213').status.must_equal(502)
    end
  end

  describe 'database' do
    before do
      @d1 = ScrabbleScorer::Word.create('hello')
    end

    after do
      @d1.destroy
    end

    it 'exists in database' do
      ScrabbleScorer::Word.exists?('hello').must_equal(true)
    end
  end
end
