class NewlyEventsController <ApplicationController
  ITEMS_PER_PAGE = 10

  def index
    @events = Event.newly
              .includes(:tags)
              .select_columns
              .popular
              .page(params[:page])
              .per(ITEMS_PER_PAGE)
  end
end
