class CardAuthorization
  def call(env)
    [200, {}, ["auth !"]]
  end
end
