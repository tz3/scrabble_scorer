require 'scrabble_scorer'
require_relative 'test_helper'
describe 'database' do
  before do
    @word = ScrabbleScorer::Word.create('hello')
  end

  after do
    @word.destroy
  end

  it 'exists in database' do
    ScrabbleScorer::Word.exists?('hello').must_equal(true)
  end
end
