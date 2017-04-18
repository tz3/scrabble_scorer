require_relative 'base'
require_relative '../score_service'
require 'json'
module ScrabbleScorer
  module Routes
    class Api < Routes::Base
      class << self
        def root(_request, _params)
          'root'
        end

        def score_word(_request, params)
          pattern = /\w+/
          return bad_request if params.size != 1 || pattern !~ params.first

          ScrabbleScorer::ScoreService.new(params.first).call.to_json
        end

        def bad_request
          ['Bad Request', 502]
        end
      end
    end
  end
end
