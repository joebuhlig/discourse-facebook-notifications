# name: discourse-facebook-notifications
# about: Adds the ability to send Discourse notifications to Facebook.
# version: 0.1
# author: Joe Buhlig joebuhlig.com
# url: https://www.github.com/joebuhlig/discourse-facebook-notifications

enabled_site_setting :facebook_notifications_enabled

register_asset "stylesheets/facebook-notifications.scss"

Discourse::Application.routes.append do
end

after_initialize do
end