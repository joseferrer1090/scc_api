class V1::StatusesController < ApplicationController
  
  def index
    @status = Status.all()
    render json: @status, status: :ok
  end

  def create
    @status = Status.create(status_params)
    @status.save
    render json: @status, status: :ok
  end

  def update
    if @status.update(status_params)
      render json: @status, status: :ok
    else
      render json: { message: @status.errors.map { |x, mess| "#{x} #{mess}".capitalize } }, status: :unprocessable_entity
    end
  end

  def destroy
    @status = Status.where(id: params[:id]).first 
    if @status.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def status_params
    params.permit(:name, :description)
  end
  
end
