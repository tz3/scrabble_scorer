require_relative 'routes/api'

module ScrabbleScorer
  class Dispatcher
    class << self

      def dispatcher(request)
        route_match = /^\/?(?<route>\w*)\/?(?<param>\w*)\/?$/.match(request.path)
        if route_match
          route = route_match['route']
          param = route_match['param']
          route = 'root' if (route.strip.size == 0)
          response(*Routes::Api.dispatcher(route, request, param))
        else
          response('404', 404)
        end
      rescue RuntimeError
        response(['Something happened, but we already know about it', 500])
      end

      private

      def response(*arr)
        Rack::Response.new(*arr)
      end
    end

  end
end