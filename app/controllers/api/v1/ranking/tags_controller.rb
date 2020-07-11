class Api::V1::Ranking::TagsController <ApplicationController
  DEFAULT_GET_TAGS_NUMS = 10
  DEFAULT_GET_EVENTS_NUMS = 5

  def index
    tags_num = (params[:tags_num] || DEFAULT_GET_NUMS).to_i
    @events_num = (params[:events_num] || DEFAULT_GET_EVENTS_NUMS).to_i
    @tags = params[:ranking] === 'related' ? Event.popular_event_tags(tags_num) : Tag.related_event_many_order(tags_num)
  end
end
