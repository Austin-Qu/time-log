class PostPolicy < ApplicationPolicy
  def update?
    return true if post_approved? && admin?
    return true if !post_approved? && user_or_admin?
  end

  def approve?
    return true if admin?
  end

  private

  def admin?
    admin_types.include?(user.type)
  end

  def user_or_admin?
    record.user_id == user.id || admin?
  end

  def post_approved?
    record.approved?
  end
end
