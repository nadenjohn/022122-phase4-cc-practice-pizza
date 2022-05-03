class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy]
rescue_from ActiveRecord::RecordNotFound, with: :invalid_restaurnt

  # GET /restaurants
  def index
    @restaurants = Restaurant.all

    render json: @restaurants.to_json(except: [:pizzas])
  end

  # GET /restaurants/1
  def show
    render json: @restaurant, serializer: RestaurantPizzaSerializer
  end

  # POST /restaurants
  # def create
  #   @restaurant = Restaurant.new(restaurant_params)

  #   if @restaurant.save
  #     render json: @restaurant, status: :created, location: @restaurant
  #   else
  #     render json: @restaurant.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /restaurants/1
  # def update
  #   if @restaurant.update(restaurant_params)
  #     render json: @restaurant
  #   else
  #     render json: @restaurant.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address)
    end

    def invalid_restaurnt
      render json: {error: 'Restaurant not found'}, status: :not_found
    end
end
