require 'scrabble_scorer'
require_relative 'test_helper'

describe ScrabbleScorer::ScoreService do
  describe 'word not in database' do
    subject { ScrabbleScorer::ScoreService.new('test').call }

    it 'score invalid' do
      subject[:valid].must_equal(false)
    end
  end
  describe 'database filled' do
    before do
      @d1 = ScrabbleScorer::Word.create('hello')
    end

    after do
      @d1.destroy
    end
    subject { ScrabbleScorer::ScoreService.new('hello').call }
    it 'valid' do
      subject[:valid].must_equal(true)
    end

    it 'score' do
      subject[:score].must_equal(8)
    end
  end
end
