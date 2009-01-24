class BookmarksController < ApplicationController
  before_filter :login_required
  def index
    @bookmarks = Bookmark.find_all_by_user_id(current_user.id, :order => 'updated_at desc', :include => :webpage)
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @webpage = Webpage.find_by_url(params[:webpage][:url])
    if @webpage.nil?
      @webpage = Webpage.new(params[:webpage])
      unless @webpage.save
        render :action => "new"
      end
    end

    new_bm = false
    @bookmark = Bookmark.find_by_user_id_and_webpage_id(current_user.id, @webpage.id)
    if @bookmark.nil?
      @bookmark = Bookmark.new(:user_id => current_user.id, :webpage_id => @webpage.id)
      new_bm = true
    end
    @bookmark.comment = params[:bookmark][:comment]
    if @bookmark.save
      if new_bm
        CicindelaIf::set(current_user.id, @webpage.id)
      end
      flash[:notice] = 'Bookmark was successfully created.'
      redirect_to(bookmarks_url)
    else
      render :action => "new"
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(params[:bookmark])
      flash[:notice] = 'Bookmark was successfully updated.'
      redirect_to(bookmarks_url)
    else
      render :action => "edit"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    CicindelaIf::del(current_user.id, @webpage.id)
    redirect_to(bookmarks_url)
  end
end
