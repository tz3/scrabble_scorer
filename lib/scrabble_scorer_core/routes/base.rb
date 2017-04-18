require_relative 'routes'
class Routes::Base
  class << self
    def dispatcher(method, request, params)
      if request.get?
        send(method, request, params)
      else
        not_found(request, params)
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
