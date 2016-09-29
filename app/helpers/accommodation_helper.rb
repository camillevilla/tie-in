module AccommodationHelper
  def attending?(user)
    @accommodation.users.include?(user)
  end
end
