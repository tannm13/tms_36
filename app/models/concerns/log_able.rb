module LogAble
  def log_activity action_name = "finish"
    action_description = case self.class.name
      when "UserCourse" then self.course.name
      when "UserSubject" then self.subject.name
      when "UserTask" then self.task.name
    end
    Activity.create user_id: self.user.id, target_id: self.id,
      target_type: self.class.name, name: action_name,
      description: action_description
  end
end
