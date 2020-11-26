module ApplicationHelper
  require 'uri'

  def text_url_to_link(text)
    URI.extract(text, %w[http https]).uniq.each do |url|
      sub_text = ''
      sub_text << '<a href=' << url << " target=\"_blank\">" << url << '</a>'

      text.gsub!(url, sub_text)
    end

    return text
  end

  def unchecked_notifications
    @notifications =
      (current_club || current_student).passive_notifications.where(
        checked: false
      )
  end
end
