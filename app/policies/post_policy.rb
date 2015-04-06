class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
  if user.present?
    if user.admin? || user.moderator? || scope.where( user_id: user.id ).exists?
      true
    else
      false
    end
  else
    false
  end
end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.nil?
        scope.none
      elsif user.admin? or user.moderator?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end
end
