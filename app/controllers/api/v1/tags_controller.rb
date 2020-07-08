class Api::V1::TagsController <ApplicationController
  ITEMS_PER_PAGE = 10

  def index
    tags = Tag.all.page(params[:page]).per(ITEMS_PER_PAGE).select(:id, :name).order(:name)
    render json: { tags: tags }
  end

  def show
    tag = Tag.find(params[:id])
    render json: { tag: tag, events: tag.events.select_columns }
  end
end
