import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'notification_widget.dart' show NotificationWidget;
import 'package:flutter/material.dart';

class NotificationModel extends FlutterFlowModel<NotificationWidget> {
  ///  Local state fields for this page.

  List<double> notifications = [];
  void addToNotifications(double item) => notifications.add(item);
  void removeFromNotifications(double item) => notifications.remove(item);
  void removeAtIndexFromNotifications(int index) =>
      notifications.removeAt(index);
  void insertAtIndexInNotifications(int index, double item) =>
      notifications.insert(index, item);
  void updateNotificationsAtIndex(int index, Function(double) updateFn) =>
      notifications[index] = updateFn(notifications[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
