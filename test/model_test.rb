require 'scrabble_scorer'
require_relative 'test_helper'
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
