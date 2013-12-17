class HorsePolicy < ApplicationPolicy
  Scope = Struct.new(:user, :scope) do
    def resolve
      if user.present? && user.admin?
        scope.all
      end
    end
  end

  def initialize(user, horse)
    @user = user
    @horse = horse
  end

  def create?
    user.ata? || user.admin? if user.present?
  end

  def update?
    ### TODO: need to add owners, but not quite ready to do
    ###  so in time for presentation.
    # (user.owner? && (@user.id = @horse.owner_id)) ||
    user.ata? || user.admin? if user.present?
  end

  def destroy?
    user.admin? if user.present?
  end
end
