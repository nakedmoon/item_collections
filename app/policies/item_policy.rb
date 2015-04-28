class ItemPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      unless user
        scope.where(public: true)
      else
        scope.where('user_id = ? OR public = ?', user.id, true)
      end
    end
  end

  attr_reader :user, :item

  def initialize(user, item)
    @user = user
    @item = item
  end


  def edit?
    item.owned_by?(user)
  end

  def show?
    item.public? || item.owned_by?(user)
  end

  def destroy?
    item.owned_by?(user)
  end

  def new?
    !user.nil?
  end



end