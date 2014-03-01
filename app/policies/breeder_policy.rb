class BreederPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def initialize(user, breeder)
    @user = user
    @breeder = breeder
  end

  def create?
    user.ata? || user.admin? if user.present?
  end

  def update?
    ### TODO: need to enable breeders to edit their own data.
    # (user.breeder? && (@user.id == @breeder.id)) ||
    user.ata? || user.admin? if user.present?
  end

  def destroy?
    user.admin? if user.present?
  end
end

