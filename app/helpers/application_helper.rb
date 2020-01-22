module ApplicationHelper


  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end

  def allow_if_user_has_role(role)
    unless !current_user.nil? && current_user.role == role
      sign_out current_user
      flash[:notice] = "Sie sind nicht authorisiert!"
      redirect_to new_user_session_path
    end
  end

end
