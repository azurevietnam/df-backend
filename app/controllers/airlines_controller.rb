class AirlinesController < ApplicationController
  def index
    airlines = Airline.all  
    render json: airlines
  end

  def show
    render json: Airline.find(params[:id]), status: :ok
  end
end
