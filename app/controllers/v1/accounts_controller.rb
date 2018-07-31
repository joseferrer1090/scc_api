class V1::AccountsController < ApplicationController

  def index
    @accounts = @current_user.accounts
    render json: @accounts, status: :ok
  end

  def create
    @account = @current_user.accounts.create(params_account)
    render json: @account, status: :ok
  end

  def show
    @account = @current_user.accounts.find(params[:id])
    render json: @account, status: :ok
  end

  def destroy
    @cuena = Account.where(id: params[:id]).first 
    if @Account.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  def update
    if @Account.update(params_Account)
      render json: @Account, status: :ok
    else
      render json: { message: @Account.errors.map { |x, mess| "#{x} #{mess}".capitalize } }, status: :unprocessable_entity
    end
  end

  private

  def params_Account
    params.permit(
      :fecha_Account,
      :contratista_id,
      :concepto,
      :valor_Account,
      :estado_id
    )
  end

end
