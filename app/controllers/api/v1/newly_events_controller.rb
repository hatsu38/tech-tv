class Api::V1::NewlyEventsController <ApplicationController
  ITEMS_PER_PAGE = 10

  def index
    events = Event.published
                  .newly
                  .order(id: :desc)
                  .includes(:tags)
                  .select_columns
                  .popular
                  .page(params[:page])
                  .per(ITEMS_PER_PAGE)
    render json: {events: events, total_count: events.total_count}
  end
end
