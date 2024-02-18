class App
  def initialize
    @routes = build_routes
  end

  def call(env)
    endpoint = @routes[env[::Rack::REQUEST_METHOD]][env[::Rack::PATH_INFO]]
    raise NotFoundError unless endpoint

    endpoint.call(env)
  end

  private

  def build_routes
    {
      'GET' => {
        '/' => ->(env) { [200, {}, ['Welcome!!!']] },
      },
      'POST' => {
        '/authorization' => CardAuthorization.new
      }
    }
  end
end
