class UserSkillsController < ApplicationController
  def new
    @user_skill = UserSkill.new
  end

  def create

    selected_skills = params[:user_skill][:skill_id].map { |id| id.to_i }.reject { |id| id == 0 }

    ids_to_create = selected_skills - current_user.skill_ids
    ids_to_destroy = current_user.skill_ids - selected_skills

    ids_to_create.each do |skill_id|
      @user_skill = UserSkill.create(skill_id: skill_id, user_id: current_user.id)
    end

    ids_to_destroy.each do |skill_id|
      @user_skill = UserSkill.find_by(skill_id: skill_id, user_id: current_user.id)
      @user_skill.destroy
    end

    redirect_to dashboard_path(tab: "Skills")
  end

  def update_level
    levels = params[:user_skill][:mastery_level]
    if params[:user_skill][:learning_interest]
      interests = params[:user_skill][:learning_interest].keys.map { |id| id.to_i }
    else
      interests = []
    end

    levels.each do |id, mastery_level|
      @user_skill = UserSkill.find_by(skill_id: id, user_id: current_user.id)
      # if it exists in the learning interest
      if interests.include?(id.to_i)
        @user_skill.update(mastery_level: mastery_level, learning_interest: true)
      else
        @user_skill.update(mastery_level: mastery_level, learning_interest: false)
      end
    end
    redirect_to dashboard_path
  end

  private

  def user_skill_params
    params.require(:user_skill).permit(skill_id: [])
  end

end
