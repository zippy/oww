module ApplicationHelper
  def nav_link(text,path,title,active_path = nil)
    options = {:title => title}
    if active_path.nil?
      if path =~ /(\/[^\/]+)/
        active_path = $1
      end
    end
    if (!active_path.blank? && request.path =~ /^#{active_path}/) || (path == '/' && request.path == '/')
      options[:class] = 'active' 
    end
    link_to text,path,options
  end
end
