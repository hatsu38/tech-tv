module Healthcheckable
  extend ActiveSupport::Concern

  def index
    render json: { status: :ok }
  end
end
