module ApplicationHelper
  def dom_class_for_controller
    params[:controller].split('/').map { |c| c.camelize }.join(' ')
  end

  def dom_id_for_action
    params[:action].camelize
  end
end
