class V1::ContractorsController < ApplicationController

  def index
    @contractor = Contractor.all()
    render json: @contractor, status: :ok
  end

  def create
    @contractor = Contractor.new(contractor_params)
    @contractor.save
    render json: @contractor, status: :ok
  end

  def destroy
    @contractor = Contractor.where(id: params[:id]).first 
    if @contractor.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  def update
    if @contractor.update(contractor_params)
      render json: @contractor, status: :ok
    else
      render json: { message: @contractor.errors.map { |x, mess| "#{x} #{mess}".capitalize } }, status: :unprocessable_entity
    end
  end

  private 

  def contratista_params
    params.permit(
      :identificacion,
      :nombre,
      :apellido,
      :correo,
      :password,
      :repassword
    )
  end
end