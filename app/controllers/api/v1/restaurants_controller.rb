class Api::V1::RestaurantsController < Api::V1::BaseController
   before_action :set_restaurant, only: [ :show, :update ] 

  def index
    @restaurants = Restaurant.all
  end

  def show

  end

  def update
    if @restaurant.update(restaurant_params)
      render json: @restaurant

    else
      render_error
    end
  end

   def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render :show, status: :created
      render json: @restaurant
    else
      render_error
    end
  end

   def destroy
    @restaurant.destroy
    head :no_content
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  
  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end

end