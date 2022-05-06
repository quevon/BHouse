# json.pagination do
#     json.current_page @properties.current_page
#     json.per_page @properties.per_page
#     json.total_entries @properties.total_entries
#   end
  json.properties @properties do |property|
    json.id property.id
    # json.user do
    #   json.id property.user.id
    #   json.name property.user.name
    # end
    json.property_type property.property_type
    json.image_url property.image_url if property.image
    json.created_at property.created_at
  end