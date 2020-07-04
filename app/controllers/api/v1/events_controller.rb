class Api::V1::EventsController <ApplicationController

  def index
    today = Time.zone.now.end_of_day

    events = Event.where(started_at: [(today - 2.weeks)..today])
                   .select(:id, :title, :catch, :connpass_event_url, :hash_tag, :started_at, :ended_at, :limit, :accepted, :waiting, :applicant)
                   .order(applicant: :desc)
    render json: { events: events, total_count: events.size }
  end

  def show
    event = Event.find(params[:id])
    render json: { event: event }
  end
end
