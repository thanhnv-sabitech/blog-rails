class PostDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def status_icon
    if object.draft?
      h.content_tag(:i, "", class: "fa fa-lock", title: "Draft")
    elsif object.published?
      h.content_tag(:i, "", class: "fa-solid fa-user", title: "Published")
    end
  end

  def created_at_formatted
    object.created_at.strftime("%Y-%m-%d %H:%M")
  end
end
