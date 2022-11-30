class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:update, :destroy]

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    @bookmark.pathway = Pathway.find(params[:pathway_id])
    if @bookmark.save
      redirect_to pathway_path(@bookmark.pathway, anchor: "bookmarks"), notice: "Done"
    else
      render "pathways/show", status: :unprocessable_entity
    end
  end

  def update
    @bookmark.update(bookmark_params)
    redirect_to pathway_path(@bookmark.pathway)
  end

  #delete
  def destroy
    @bookmark.destroy
    redirect_to pathway_path(@bookmark.pathway), notice: "The bookmark was deleted."
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:note)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
