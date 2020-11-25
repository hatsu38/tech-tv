class EventsController < ApplicationController
  ITEMS_PER_PAGE = 10
  TAGS_COUNT = 20
  def index
    @events = event_search_range(params)
              .published_popular_select_tags_with_movies_tags
              .page(params[:page])
              .per(params[:per] || ITEMS_PER_PAGE)
    @total_events_count = @events.total_count
    @newly_events = Event.published_popular_select_tags_with_movies_tags
                         .newly
                         .order(id: :desc)
                         .page(params[:page])
                         .per(params[:per] || ITEMS_PER_PAGE)
    @total_newly_events_count = @newly_events.total_count
    @tags = Tag.related_event_many_order(TAGS_COUNT)
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
    when "recent", nil
      Event.recent
    when "monthly"
      Event.monthly
    when "all"
      Event.all
    end
  end
end
