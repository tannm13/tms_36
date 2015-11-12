class Activity < ActiveRecord::Base
  belongs_to :user

  scope :recent, ->{order created_at: :desc}
  scope :by_target, ->target{where "target_type = ? and target_id = ?",
    target.class.name, target.id}

  def target
    self.target_type.constantize.find_by_id self.target_id
  end
end
