module LogActivity
  def log_activity object, action_name
    Activity.create user_id: current_user.id, target_id: object.id,
      target_type: object.class.name, name: action_name
  end
end
