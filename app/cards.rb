module App
  class Cards < BaseResource
    def process
      DB[:cards].all.to_json
    end
  end
end
