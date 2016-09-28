module ApplicationHelper
  include DeviseHelper

  # Long date format, including time
  def pretty_date(date)
    date.strftime("%B %d, %Y, %l:%M%P")
  end

  # Short date format
  def short_date(date)
    date.strftime("%m/%y")
  end

  # Short time format
  def short_time(date)
    date.strftime("%l:%M%P")
  end

end
