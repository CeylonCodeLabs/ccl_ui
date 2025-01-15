part of '../ccl_ui_configurator.dart';

class BackgroundProgressSettings {
  final TextStyle? messageStyle;

  /// Whether to blur the background while the progress indicator is shown.
  final bool blurBackground;

  /// An optional progress indicator to display while the ViewModel is busy.
  final Widget? progressIndicator;

  /// Whether to show the child widget while the ViewModel is busy.
  final bool isChildVisibleWhileBusy;
  final Color? backgroundColor;

  BackgroundProgressSettings({
    this.messageStyle,
    this.blurBackground = true,
    this.progressIndicator,
    this.isChildVisibleWhileBusy = true,
    this.backgroundColor,
  });

  static BackgroundProgressSettings defaultSettings(BuildContext context) {
    return BackgroundProgressSettings(
      messageStyle: context.styleTitleMedium?.copyWith(
        color: context.colors.onPrimaryContainer,
        shadows: [
          BoxShadow(
            color: context.colors.primaryContainer,
            spreadRadius: 5.0,
            blurRadius: 10.0,
          ),
        ],
      ),
      backgroundColor: context.colors.primaryContainer.withOpacity(0.5),
      progressIndicator: const CircularProgressIndicator(strokeWidth: 3.0),
    );
  }
}
