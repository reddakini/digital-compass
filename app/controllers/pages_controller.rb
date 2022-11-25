class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @pathways = Pathway.all
  end

  def assessment
  end
end
