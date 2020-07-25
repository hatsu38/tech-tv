class Api::V1::NewlyEventsController < Api::V1::BaseController
  ITEMS_PER_PAGE = 10

  def index
    events = Event.published
                  .newly
                  .order(id: :desc)
                  .published_popular_select_tags_with_movies_tags
                  .page(params[:page])
                  .per(ITEMS_PER_PAGE)
    render json: {events: events, total_count: events.total_count}
  end
end
