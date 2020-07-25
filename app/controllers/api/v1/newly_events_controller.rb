class Api::V1::NewlyEventsController < Api::V1::BaseController
  ITEMS_PER_PAGE = 10

  def index
    @events = Event.published_popular_select_tags_with_movies_tags
                  .newly
                  .order(id: :desc)
                  .page(params[:page])
                  .per(ITEMS_PER_PAGE)
    render 'api/v1/events/index'
  end
end
