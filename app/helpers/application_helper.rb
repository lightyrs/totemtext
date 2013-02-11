module ApplicationHelper

  def page_header_content
    content_for?(:page_header) ? yield(:page_header) : "<h1>#{ENV['APP_NAME']}</h1>".html_safe
  end

  def content_header_content
    content_for?(:content_header) ? yield(:content_header) : "<h2>Content Header</h2>".html_safe
  end
end
