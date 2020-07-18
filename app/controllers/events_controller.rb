class EventsController <ApplicationController
  ITEMS_PER_PAGE = 10

  def index
    @events = event_search_range(params)
              .published
              .includes(:tags)
              .select_columns
              .popular
              .page(params[:page])
              .per(ITEMS_PER_PAGE)
  end

  def show
    @event = Event.published.find(params[:id])
    @movies = @event.movies.published
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