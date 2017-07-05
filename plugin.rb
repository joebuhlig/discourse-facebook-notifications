# name: discourse-facebook-notifications
# about: Adds the ability to send Discourse notifications to Facebook.
# version: 0.1
# author: Joe Buhlig joebuhlig.com
# url: https://www.github.com/joebuhlig/discourse-facebook-notifications

enabled_site_setting :facebook_notifications_enabled

register_asset "stylesheets/facebook-notifications.scss"

DiscoursePluginRegistry.serialized_current_user_fields << "user_facebook_notifications_enabled"

Discourse::Application.routes.append do
end

after_initialize do

  User.register_custom_field_type('user_facebook_notifications_enabled', :boolean)

  require_dependency 'user_serializer'
  class ::UserSerializer
    attributes :user_facebook_notifications_enabled

    def user_facebook_notifications_enabled
      if !object.custom_fields["user_facebook_notifications_enabled"]
        object.custom_fields["user_facebook_notifications_enabled"] = false
        object.save
      end
      object.custom_fields["user_facebook_notifications_enabled"]
    end
  end
end