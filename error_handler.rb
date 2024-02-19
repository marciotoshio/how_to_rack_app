class ErrorHandler
  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  rescue NotFoundError
    [404, {}, ["not found"]]
  rescue => e
    puts e.message
    [500, {}, ["internal server error"]]
  end
end
