class BookmarksController < ApplicationController
  def show
    @bookmark = set_bookmark
  end
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list), notice: "Movie added to list."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = set_bookmark
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: "Movie removed from list."
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
