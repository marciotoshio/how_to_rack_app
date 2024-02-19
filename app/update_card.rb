module App
  class UpdateCard < BaseResource
    def process
      card = Models::Card[body_params[:id]]
      card.name = body_params[:name]
      card.balance = body_params[:balance]
      card.save
      @status = 204
      nil
    end
  end
end
