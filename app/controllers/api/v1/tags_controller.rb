class Api::V1::TagsController < Api::V1::BaseController
  ITEMS_PER_PAGE = 10

  def index
    @tags = Tag.related_event_many_order.page(params[:page]).per(params[:per] || ITEMS_PER_PAGE).preload(:events)
  end

  def show
    @tag = Tag.find(params[:id])
    @events = @tag.events.published_popular_select_tags_with_movies_tags.page(params[:page] || 1).per(params[:per] || ITEMS_PER_PAGE)
    @total_count = @events.total_count
  end
end
