class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def create
    restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
    render json: restaurant_pizza.pizza, status: :created
  end

  private

  def restaurant_pizza_params
   params.permit(:restaurant_id, :pizza_id, :price)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
      end

end
