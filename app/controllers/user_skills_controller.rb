class UserSkillsController < ApplicationController
  def new
    @user_skill = UserSkill.new
  end
end
