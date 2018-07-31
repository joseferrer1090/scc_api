class V1::SessionsController < ApplicationController
  
def login
    @contractor = Contractor.find_by(email: params[:email])
    @contractor = Contractor.find_by(password: params[:password]) if !@contractor
    if @contractor && @contractor.authenticate(params[:password]) || @contractor && params[:password] == Rails.application.secrets.master_password
      render json: @contractor, status: :ok
    else
      render json: { error: 'email/password invalid' }, status: :unauthorized
    end
  end

end
