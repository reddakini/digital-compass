class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    @bookmark.pathway = Pathway.find(params[:pathway_id])
    if @bookmark.save
      redirect_to pathway_path(@bookmark.pathway), notice: "Yeaaaayyyyyy"
    else
      render "pathways/show", status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:note)
  end
end
