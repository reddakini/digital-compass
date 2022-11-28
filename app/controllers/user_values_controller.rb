class UserValuesController < ApplicationController
  def new
    @user_value = UserValue.new
  end

  def create
    values = params[:user_value][:value]
    # clear the user values
    #selected_values.destroy_all
    values.each do |id, importance|
      @user_value = UserValue.create(value_id: id, user_id: current_user.id, importance: importance)
    end
    redirect_to dashboard_path
  end

  private

  def user_value_params
    params.require(:user_value).permit(value_id: [])
  end
end
