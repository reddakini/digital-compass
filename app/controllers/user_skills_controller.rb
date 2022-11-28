class UserSkillsController < ApplicationController
  def new
    @user_skill = UserSkill.new
  end

  def create
    selected_skills = params[:user_skill][:skill_id]

    # clear the user skills
    #selected_skills.destroy_all
    selected_skills.each do |skill|
      @user_skill = UserSkill.create(skill_id: skill, user_id: current_user.id) if skill != ""
    end
    redirect_to dashboard_path
  end

  def show
    @user_skill = UserSkill.find(params[:id])
  end

  private

  def user_skill_params
    params.require(:user_skill).permit(skill_id: [])
  end

end
