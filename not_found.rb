class NotFound
  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  rescue NotFoundError
    [404, {}, ["not found"]]
  end
end
