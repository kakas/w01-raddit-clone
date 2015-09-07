module ApplicationHelper
  def notice_message
    close_button_option = { class: "close", "type" => "button", "data-dismiss" => "alert", "aria-label" => "Close", "aria-hidden" => "true" }
    close_button = content_tag(:button, '&times;'.html_safe, close_button_option)
    alert_types = { notice: :info, alert: :danger }

    message =
      flash.map do |type, msg|
        alert_content = close_button + msg
        alert_type = alert_types[type.to_sym] || type
        alert_class = { class: "alert alert-#{alert_type} alert-dismissible", role: "alert" }
        content_tag(:div, alert_content, alert_class)
      end

    message.join('\n').html_safe


  end
end
