class PathwaysController < ApplicationController
  def index
    @pathways = Pathway.all
  end



end
