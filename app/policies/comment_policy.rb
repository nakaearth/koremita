class CommentPolicy < ApplicationPolicy
  def update?
    record.user == user ? true : false
  end

  def destroy?
    record.user == user ? true : false
  end
end
