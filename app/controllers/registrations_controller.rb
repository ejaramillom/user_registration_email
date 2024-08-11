class RegistrationsController < ApplicationController
  def create
    user = User.new(registration_params)
    if user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: {errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def registration_params
    params.require(:user).permit(:email, :username, :password)
  end
end
