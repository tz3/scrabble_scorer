require_relative 'scrabble_scorer_core/routes/api'
require_relative 'scrabble_scorer_core/connection'
require_relative 'scrabble_scorer_core/word'
require_relative 'scrabble_scorer_core/dispatcher'
module ScrabbleScorer
  class ScrabbleScorer
    def self.call(env)
      scrabbleCore = new(env)
      scrabbleCore.call.finish
    end

    def initialize(env)
      @request = Rack::Request.new(env)
    end

    def call
      Dispatcher.dispatcher(@request)
    end

  end
end
