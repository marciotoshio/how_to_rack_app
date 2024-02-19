module App
  class BaseResource
    def call(env)
      @env = env
      result = process
      [@status || 200, headers, [result || '']]
    end

    def query_params
      request.params
    end

    def body_params
      request_body_io = request.body
      request_body = request_body_io.read; request_body_io.rewind
      JSON.parse(request_body).transform_keys(&:to_sym)
    end

    def request
      Rack::Request.new(@env)
    end

    def process
      ''
    end

    def headers
      { 'Content-Type' => 'text/json' }
    end
  end
end
