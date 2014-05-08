class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.new(user_params)
    @user.password = SecureRandom.hex(8)
    @user.check_in_count = 0
    if @user.save
      redirect_to check_in_path(device_id: @user.device_id)
    else
      redirect_to new_user_path(user_name: @user.name, user_email: @user.email, device_id: @user.device_id),
                  :flash => { :error => @user.errors.full_messages.uniq }
    end
  end

  def edit
    super
  end

  def update
    super
  end

  protected

  def user_params
    params.require(:user).permit(:email, :name, :device_id)
  end
end