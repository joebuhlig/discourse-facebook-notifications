import { observes } from 'ember-addons/ember-computed-decorators';
import { default as computed } from "ember-addons/ember-computed-decorators";
import NotificationPreferencesController from 'discourse/controllers/preferences/notifications';
import UserController from 'discourse/controllers/user';

export default {
  name: 'mlm_daily_summary',

  initialize(container){
    NotificationPreferencesController.reopen({
      userFacebookNotificationsEnabled(){
        const user = this.get("model");
        return user.get("custom_fields.user_facebook_notifications_enabled");
      },

      @observes("model.custom_fields.user_facebook_notifications_enabled")
      _setUserMLMDailySummary(){
        var attrNames = this.get("saveAttrNames");
        attrNames.push('custom_fields');
        this.set("saveAttrNames", attrNames);
        const user = this.get("model");
        const userFacebookNotificationsEnabled = user.custom_fields.user_facebook_notifications_enabled;
        user.set("custom_fields.user_facebook_notifications_enabled", userFacebookNotificationsEnabled);
      }
    })
  }
}