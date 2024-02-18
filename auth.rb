class Auth
  def initialize(app)
    @app = app
  end

  def call(env)
    auth_token = env['HTTP_AUTHORIZATION']
    return [401, {}, ['Unauthorized']] if auth_token != 'password'

    @app.call(env)
  end
end
