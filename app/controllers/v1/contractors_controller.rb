class V1::ContractorsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
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

  def contractor_params
    params.permit(
      :identification,
      :name,
      :last_name,
      :email,
      :password_digest,
      :password_confirmation,
      :access_token
    )
  end

  def set_user
    @contractor = Contractor.find_by(access_token:request.headers['token'])
  end

end