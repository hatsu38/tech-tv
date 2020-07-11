class Api::V1::Ranking::TagsController <ApplicationController
  DEFAULT_GET_NUMS = 10

  def index
    per_num = (params[:num] || DEFAULT_GET_NUMS).to_i
    @tags = params[:ranking] === 'related' ? Event.popular_event_tags(per_num) : Tag.related_event_many_order(per_num)
  end
end
