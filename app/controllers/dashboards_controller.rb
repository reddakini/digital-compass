class DashboardsController < ApplicationController

  def dashboard
    @progress_chart = {Quiz: 7, Skills: 2}
    @result_chart = Pathway.group(:name).count
  end
end
