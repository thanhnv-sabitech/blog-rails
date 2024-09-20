module ApplicationHelper
  def flash_messages
    flash.each_with_object([]) do |(key, message), messages|
      if message.present?
        classes = "alert alert-dismissible fade show"
        classes += key == "notice" ? " alert-success" : " alert-danger"
        messages << content_tag(:div, class: classes, role: "alert") do
          concat message
          concat button_tag("".html_safe, type: "button", class: "btn-close", 'data-bs-dismiss': "alert", 'aria-label': "Close")
        end
      end
    end.join.html_safe
  end

  def field_errors(object, field)
    return unless object.errors.any?
    object.errors.full_messages_for(field).map do |message|
      content_tag(:small, message, class: "text-danger")
    end.join.html_safe
  end
end
