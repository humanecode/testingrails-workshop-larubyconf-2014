module PermissionsHelper
  def can_create_post?
    current_user.present? &&
      ( @group.is_member?(current_user) &&
        @group.post_for(current_user, @date).nil? )
  end
end
