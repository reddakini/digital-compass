class UserValuesController < ApplicationController
  def new
    @user_value = UserValue.new
  end

  def create
    if params[:user_value].present?
      selected_values = params[:user_value][:value].to_unsafe_h.filter { |k, v| !v.empty? }.keys.map { |id| id.to_i }
          # values = params[:user_value][:value_id].map { |id| id.to_i }.reject { |id| id == 0 }

      ids_to_create = selected_values - current_user.value_ids
      ids_to_update = selected_values
      ids_to_destroy = current_user.value_ids - selected_values

      ids_to_create.each do |value_id|
        importance = params[:user_value][:value][value_id.to_s]
        @user_value = UserValue.create(value_id: value_id, user_id: current_user.id, importance: importance)
      end

      ids_to_destroy.each do |value_id|
        @user_value = UserValue.find_by(value_id: value_id, user_id: current_user.id)
        @user_value.update(importance: 0)
      end

      ids_to_update.each do |value_id|
        importance = params[:user_value][:value][value_id.to_s]
        @user_value = UserValue.find_by(value_id: value_id, user_id: current_user.id)
        @user_value.update(importance: importance)
      end
    else
      ids_to_destroy = current_user.value_ids

      ids_to_destroy.each do |value_id|
        @user_value = UserValue.find_by(value_id: value_id, user_id: current_user.id)
        @user_value.update(importance: 0)
      end
    end
      # values.each do |id, importance|
      #   existing = UserValue.find_by(value_id: id, user_id: current_user.id)
      #   if existing
      #     existing.update(importance: importance)
      #   else
      #     @user_value = UserValue.create(value_id: id, user_id: current_user.id, importance: importance)
      #   end
      # end
    redirect_to dashboard_path

  end



                                                # def create

                                                #   ids_to_create.each do |skill_id|
                                                #     @user_skill = UserSkill.create(skill_id: skill_id, user_id: current_user.id)
                                                #   end

                                                #   ids_to_destroy.each do |skill_id|
                                                #     @user_skill = UserSkill.find_by(skill_id: skill_id, user_id: current_user.id)
                                                #     @user_skill.destroy
                                                #   end

                                                #   redirect_to dashboard_path(tab: "Skills")
                                                # end

  private

  def user_value_params
    params.require(:user_value).permit(value_id: [])
  end
end
