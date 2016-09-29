module ApplicationHelper
  include DeviseHelper

  # Long date format, including time
  def pretty_date(date)
    date.strftime("%B %d, %Y, %l:%M%P")
  end

  # Short date format
  def short_date(date)
    date.strftime("%m/%d/%y")
  end

  # Short time format
  def short_time(date)
    date.strftime("%l:%M%P")
  end

  def send_invitation(email_address)
    Mail.deliver do
      from 'invite@tiein.com'
      to email_address
      subject 'You have been invited to join Tie-In!'
      body 'This is a test email.'
    end
  end

end
