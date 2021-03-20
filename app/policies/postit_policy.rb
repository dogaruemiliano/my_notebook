class PostitPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(user: @user)
    end

    private

    attr_reader :user, :scope
  end

  def create?
    return true
  end

  def edit?
    return record.user == @user
  end

  def update?
    return record.user == @user
  end

  def destroy?
    return record.user == @user
  end
end
