module App
  class CreateCard < BaseResource
    def process
      card = Models::Card.create(body_params)
      @status = 201
      card.values.to_json
    end
  end
end
