class TagsController <ApplicationController
  ITEMS_PER_PAGE = 30

  def show
    @tag = Tag.find(params[:id])
    @events = @tag.events
                .includes(:tags)
                .select_columns
                .popular
                .page(params[:page])
                .per(ITEMS_PER_PAGE)
    @total_count = @events.total_count
  end
end
