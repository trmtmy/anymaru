# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :reject_customer, only: [:create]

  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      # ↑特定されないようにランダムなパスワード
      customer.name = "ゲスト"
      customer.profile = "ゲストユーザーです。"
      customer.area = "関東"
      customer.is_deleted = false
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストとしてログインしました。'
  end

  protected

  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    if @customer
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
        flash[:alert] = "このアカウントは退会済みです。"
        redirect_to new_customer_session_path
      end
    else
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
end
