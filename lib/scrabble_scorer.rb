require_relative 'scrabble_scorer_core/routes/api'
require_relative 'scrabble_scorer_core/connection'
require_relative 'scrabble_scorer_core/word'
module ScrabbleScorer
  class Core
    def self.call(env)
      scrabbleCore = new(env)
      scrabbleCore.call.finish
    end

    def initialize(env)
      @request = Rack::Request.new(env)
    end

    def call
      dispatcher
    end

    def dispatcher
      # separate by different routes
      res = @request.path.split('/')
      method = res[1] || 'root'
      params = res[2..-1] || []
      response(*Routes::Api.dispatcher(method, @request, params))
    rescue RuntimeError
      response(['Something happened, but we already know about it', 500])
    end

    private

    def response(*arr)
      Rack::Response.new(*arr)
    end
  end
end
