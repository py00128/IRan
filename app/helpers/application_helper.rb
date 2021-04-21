module ApplicationHelper
  def current_class?(site_path)
    return 'active' if request.path == site_path
    ''
  end
end
