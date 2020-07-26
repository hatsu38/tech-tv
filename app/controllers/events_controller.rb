class EventsController <ApplicationController
  ITEMS_PER_PAGE = 10

  def index
    @events = event_search_range(params)
              .published_popular_select_tags_with_movies_tags
              .page(params[:page])
              .per(ITEMS_PER_PAGE)
  end

  def show
    @event = Event.joins(:movies).published.find(params[:id])
    @movies = @event.movies.published
    @thumbnail = @movies.first.thumbnail_url
    @tags = @event.tags
  end

  private

  def event_search_range(params)
    case params[:range]
    when 'recent', nil
      Event.recent
    when 'monthly'
      Event.monthly
    when 'all'
      Event.all
    end
  end
end