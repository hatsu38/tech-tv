class NewlyEventsController <ApplicationController
  ITEMS_PER_PAGE = 10

  def index
    @events = Event.published
                  .newly
                  .published_popular_select_tags_with_movies_tags
                  .page(params[:page])
                  .per(ITEMS_PER_PAGE)
  end
end
