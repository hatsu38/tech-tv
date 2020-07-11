class Api::V1::Ranking::TagsController <ApplicationController
  DEFAULT_GET_NUMS = 10

  def index
    @tags = params[:ranking] === 'related' ? Event.popular_event_tags(DEFAULT_GET_NUMS) : Tag.related_event_many_order(DEFAULT_GET_NUMS)
  end
end
