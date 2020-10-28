class TagsController <ApplicationController
  ITEMS_PER_PAGE = 10

  def index; end

  def show
    @tag = Tag.find(params[:id])
    @events = @tag.events
                  .published_popular_select_tags_with_movies_tags
                  .page(params[:page] || 1)
                  .per(params[:per] || ITEMS_PER_PAGE)
    @total_count = @events.total_count
    @newly_events = Event.published_popular_select_tags_with_movies_tags
                  .newly
                  .order(id: :desc)
                  .page(params[:page])
                  .per(params[:per] || ITEMS_PER_PAGE)
    @total_newly_events_count = @newly_events.total_count
    @total_count = @events.total_count
  end
end
