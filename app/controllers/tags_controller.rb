class TagsController <ApplicationController
  ITEMS_PER_PAGE = 10

  def show
    @tag = Tag.find(params[:id])
    @events = @tag.events
                .includes(:tags)
                .select_columns
                .popular
                .page(params[:page])
                .per(ITEMS_PER_PAGE)
  end
end
