module RestaurantsHelper
  def owner_view(current_owner, restaurant)
    logger.debug("current owner: #{current_owner.inspect}, restaurant: #{restaurant.inspect}")
    return current_owner && current_owner.id == restaurant.user_id
  end
end
