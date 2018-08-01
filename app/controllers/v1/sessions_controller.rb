class V1::SessionsController < ApplicationController

  def login
    @contractor = Contractor.find_by(email: params[:email])
    if @contractor && @contractor.authenticate(params[:password_digest])
      render json: @contractor, status: :ok
    else 
      error = 'Email / Password => invalidos'
      render json: {errors: error}, status: 422
    end
  end
  
end
