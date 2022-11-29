class PathwaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @pathways = Pathway.all
  end

  def show
    @bookmark = Bookmark.new
    @pathway = Pathway.find(params[:id])
  end
end
