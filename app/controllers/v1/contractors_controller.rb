class V1::ContractorsController < ApplicationController

  def index
    @contratista = Contratista.all()
    render json: @contratista, status: :ok
  end

  def create
    @contratisa = Contratista.new(contratista_params)
    @contratisa.save
    render json: @contratisa, status: :ok
  end

  def destroy
    @contratista = Contratista.where(identificacion: params[:identificacion]).first 
    if @contratisa.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  def update
    if @contratisa.update(contratista_params)
      render json: @contratisa, status: :ok
    else
      render json: { message: @contratista.errors.map { |x, mess| "#{x} #{mess}".capitalize } }, status: :unprocessable_entity
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