class WebpagesController < ApplicationController
  layout "bookmarks"
  before_filter :login_required

  def show
    @webpage = Webpage.find(params[:id])
    @bookmarks = Bookmark.find_all_by_webpage_id(params[:id], :include => :user)
    # ランキングの上位5件取得
    ranking = CicindelaIf::get(params[:id], 5)
    picks = Webpage.find(ranking)
    # ランキングの順番どおり並べ直して配列に格納
    @recommends = []
    ranking.each {|r|
      @recommends << picks.find{|w| w.id == r}
    }    
  end

  def new
    @webpage = Webpage.new
  end

  def edit
    @webpage = Webpage.find(params[:id])
  end

  def create
    @webpage = Webpage.new(params[:webpage])

    if @webpage.save
      flash[:notice] = 'Webpage was successfully created.'
      redirect_to(@webpage)
    else
      render :action => "new"
    end
  end

  def update
    @webpage = Webpage.find(params[:id])
    if @webpage.update_attributes(params[:webpage])
      flash[:notice] = 'Webpage was successfully updated.'
      redirect_to(@webpage)
    else
      render :action => "edit"
    end
  end
end
