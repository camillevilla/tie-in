module ApplicationHelper
  # Current user
  # Until we have user authentication, just pick first user
  def current_user
    User.first
  end
end
