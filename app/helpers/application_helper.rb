# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def breadcrumbs_for(crumbs)
    result = "<ul>\r"
    last_crumb = crumbs.pop
    for crumb in crumbs
      result += "\t<li><a href=\"#{crumb[:url]}\">#{crumb[:name]}</a></li>"
    end
    result += "\t<li>#{last_crumb[:name]}</li>"
    result += "<ul>"
    result
  end
end
