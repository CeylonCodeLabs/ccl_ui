part of 'notification_icon.dart';

class NotificationIconModel extends BaseViewModel {
  // ignore: constant_identifier_names
  static const String TAG = 'NotificationIconModel';

  final NotificationService _notificationService =
      StackedLocator.instance.get();

  final OnTapNotificationIcon? _onTapNotificationIcon;

  bool _hasNotification = false;

  NotificationIconModel(this._onTapNotificationIcon) {
    _notificationService.notificationCount.listen((count) {
      hasNotification = count > 0;
      notifyListeners();
    });
  }

  // region Getters & Setters
  int get notificationCount => _notificationService.notificationCount.value;

  bool get hasNotification => _hasNotification;

  set hasNotification(bool value) {
    _hasNotification = value;
    notifyListeners();
  }

  // endregion Getters & Setters

  void onTapNotificationIcon(BuildContext context) =>
      _onTapNotificationIcon?.call(context);
}
