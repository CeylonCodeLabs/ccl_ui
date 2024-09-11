
import 'package:ccl_services/ccl_services.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../ui.dart';

part 'notification_icon_model.dart';

typedef OnTapNotificationIcon = void Function(BuildContext context);

class NotificationIcon extends StackedView<NotificationIconModel> {
  final IconData notificationIconData;
  final double notificationIconSize;

  final IconData notificationIndicatorIconData;
  final Color? notificationIndicatorColor;
  final double notificationIndicatorSize;

  final OnTapNotificationIcon? onTapNotificationIcon;

  const NotificationIcon({
    super.key,
    this.notificationIconData = Icons.notifications_none_rounded,
    this.notificationIconSize = sizeBold,
    this.notificationIndicatorIconData = Icons.circle,
    this.notificationIndicatorColor,
    this.notificationIndicatorSize = sizeDefault,
    this.onTapNotificationIcon,
  });

  @override
  Widget builder(
    BuildContext context,
    NotificationIconModel viewModel,
    Widget? child,
  ) {
    final colorNotificationIndicator =
        notificationIndicatorColor ?? context.colors.secondary;

    return InkWell(
      onTap: () => viewModel.onTapNotificationIcon(context),
      child: Padding(
        padding: const EdgeInsets.only(right: sizeSmall),
        child: Stack(
          children: [
            Icon(
              notificationIconData,
              size: notificationIconSize,
            ),
            if (viewModel.hasNotification)
              Positioned(
                top: 3,
                right: 5,
                child: Icon(
                  notificationIndicatorIconData,
                  color: colorNotificationIndicator,
                  size: notificationIndicatorSize,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  NotificationIconModel viewModelBuilder(BuildContext context) =>
      NotificationIconModel(onTapNotificationIcon);
}
