class UsersController < ApplicationController
  before_action :move_to_show, only: :destroy
  def show
    @user = User.find(current_user.id)
    @address = Address.find_by(user_id: current_user.id)
  end

  def edit
  end

  def update
  end

  def before_logout
  end



  # Payjp.api_key = PAYJP_SECRET_KEY = 'sk_test_fc909327daf398b939d901a1'
  # customer = Payjp::Customer.create(card: params[:payjp_token])

end
