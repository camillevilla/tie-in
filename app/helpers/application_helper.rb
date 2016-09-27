module ApplicationHelper
  include DeviseHelper
  # Current user
  # Until we have user authentication, just pick first user

  def pretty_date(date)
    date.strftime("%m-%d-%y, %I:%M%p")
    # replace month integer with month string later
  end

end
