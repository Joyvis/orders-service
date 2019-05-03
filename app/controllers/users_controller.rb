class UsersController < ApplicationController
  def index
    users = User.ransack(params[:q]).result
    render_success users
  end

  def create
    user = User.new(user_params)
    if user.save
      render_success user
    else
      render_error user
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render_success user
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update_attributes(user_params)
      render_success user
    else
      render_error user
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    render_success user
  rescue NoMethodError
    render_error user
  end

  private

  def user_params
    params.require(:user)
      .permit(:name, :identification_document, :email,
                orders_attributes: [:cellphone_model, :cellphone_imei,
                                    :annual_price, :installments] )
  end
end
