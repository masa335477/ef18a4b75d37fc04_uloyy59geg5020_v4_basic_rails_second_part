module ApplicationHelper
  def page_title(title = '')
    base_title = 'RUNTEQ BOARD APP'
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
