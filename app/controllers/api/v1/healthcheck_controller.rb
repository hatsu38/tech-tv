class Api::V1::HealthcheckController < Api::V1::BaseController
  include Healthcheckable
end
