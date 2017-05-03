# A classic and basic Right Manager
class RightsManager
  def initialize(current_user)
    @current_user = current_user
  end

  def can?(right_name)
    @rights_cache ||= set_rights_cache
    @rights_cache[right_name]
  end

  private

  def set_rights_cache
    Hash[*TypeUserRight.joins(:right)
         .where(type_user_id: @current_user.type_user.id)
         .pluck(:name, :value).flatten]
  end
end
