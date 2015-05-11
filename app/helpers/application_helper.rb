module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Help Me Improve"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  def error_message(status_code = 0)
    case status_code
    when 1 
      message = "Riot's Servers are having trouble. Please try again."
    when 2 
      message = "I can't find that summoner. Please try another name/region."
    else 
      message = "Oops. Something went wrong. Please try again."
    end
    message
  end
end
