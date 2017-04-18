module ScrabbleScorer
  module Routes
    class Base
      class << self
        def dispatcher(method, request, param)
          if request.get?
            send(method, request, param)
          else
            not_found(request, param)
          end
        end

        def method_missing(_method, *args)
          not_found(*args)
        end

        def respond_to_missing?(method, include_private = false)
          methods.include?(method) || super
        end

        def not_found(_request, _params)
          ['404', 404]
        end
      end
    end
  end
end
