class PathwaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @pathways = Pathway.all
  end

  def show
  end


  private

  
end
