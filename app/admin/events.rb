ActiveAdmin.register Event do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :catch, :description, :connpass_event_url, :hash_tag, :started_at, :ended_at, :limit, :event_type, :address, :place, :lat, :lon, :accepted, :waiting, :applicant, :connpass_event_id, :connpass_updated_at, :deleted_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :catch, :description, :connpass_event_url, :hash_tag, :started_at, :ended_at, :limit, :event_type, :address, :place, :lat, :lon, :accepted, :waiting, :applicant, :connpass_event_id, :connpass_updated_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
