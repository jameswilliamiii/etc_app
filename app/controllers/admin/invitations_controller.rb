class Admin::InvitationsController < Devise::InvitationsController
  def after_invite_path_for(resource)
    admin_users_url
  end
end