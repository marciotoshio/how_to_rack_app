module App
  class CardAuthorization < BaseResource
    def process
      card = Models::Card[body_params[:id]]
      if card.balance >= body_params[:amount]
        card.balance -= body_params[:amount]
        card.save
        @status = 200
      else
        @status = 403
      end
      nil
    end
  end
end
