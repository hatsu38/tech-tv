class Api::V1::EventsController <ApplicationController

  def index
    today = Time.zone.now.end_of_day

    @events = Event.
                where(started_at: [today  - 1.month..today]).
                pluck(:id, :title, :catch, :connpass_event_url, :hash_tag, :started_at, :ended_at, :limit, :accepted, :waiting)
    render json: @events
  end

  def show
    @events = Event.where(started_at: [today  - 1.month..today])
    render json: @events
  end
end
