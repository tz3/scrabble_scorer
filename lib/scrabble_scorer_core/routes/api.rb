require_relative 'base'
require_relative '../score_service'
require 'json'
module ScrabbleScorer
  module Routes
    class Api < Routes::Base
      class << self
        def root(_request, _param)
          'root'
        end

        def score_word(_request, param)
          pattern = /^[a-zA-Z]+$/
          return bad_request unless pattern.match(param)
          ScoreService.new(param).call.to_json
        end

        def bad_request
          ['Bad Request', 502]
        end
      end
    end
  end
end
