module LogAble
  def log_activity action_name = "finish"
    Activity.create user_id: self.user.id, target_id: self.id,
      target_type: self.class.name, name: action_name
  end
end
