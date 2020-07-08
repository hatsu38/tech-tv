class Api::V1::EventsController <ApplicationController
  ITEMS_PER_PAGE = 10

  def index
    @events = event_search_range(params)
              .includes(:tags)
              .select(:id, :title, :catch, :connpass_event_url, :hash_tag, :started_at, :ended_at, :limit, :accepted, :waiting, :applicant)
              .popular
              .page(params[:page])
              .per(ITEMS_PER_PAGE)
  end

  def show
    event = Event.find(params[:id])
    render json: { event: event, movies: event.movies }
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
