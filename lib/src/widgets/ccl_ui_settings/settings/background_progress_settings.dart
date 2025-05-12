part of '../ccl_ui_configurator.dart';

class BackgroundProgressSettings {
  /// The style of the message displayed above the progress indicator.
  final TextStyle? messageStyle;

  /// Whether to blur the background while the progress indicator is shown.
  ///
  /// Defaults to true.
  final bool blurBackground;

  /// An optional progress indicator to display while the ViewModel is busy.
  final Widget? progressIndicator;

  /// Whether to show the child widget while the ViewModel is busy.
  ///
  /// Defaults to true.
  final bool isChildVisibleWhileBusy;

  /// The color of the background overlay.
  final Color? backgroundColor;

  /// The gradient of the background overlay.
  final Gradient? backgroundGradient;

  /// The [ImageFilter] to apply to the background.
  final ImageFilter? backgroundBlurFilter;

  BackgroundProgressSettings({
    this.messageStyle,
    this.blurBackground = true,
    this.progressIndicator,
    this.isChildVisibleWhileBusy = true,
    this.backgroundColor,
    this.backgroundGradient,
    this.backgroundBlurFilter,
  });

  /// Creates a new [BackgroundProgressSettings] with the same properties as this one,
  /// but with the given fields replaced with the new values.
  ///
  /// The optional parameters allow you to override specific properties of the
  /// [BackgroundProgressSettings] instance. If a parameter is not provided (or is null),
  /// the corresponding property from the original instance is used.
  ///
  /// Returns a new [BackgroundProgressSettings] instance with the updated properties.
  BackgroundProgressSettings copyWith({
    TextStyle? messageStyle,
    bool? blurBackground,
    Widget? progressIndicator,
    bool? isChildVisibleWhileBusy,
    Color? backgroundColor,
    Gradient? backgroundGradient,
    ImageFilter? backgroundBlurFilter,
  }) {
    return BackgroundProgressSettings(
      messageStyle: messageStyle ?? this.messageStyle,
      blurBackground: blurBackground ?? this.blurBackground,
      progressIndicator: progressIndicator ?? this.progressIndicator,
      isChildVisibleWhileBusy:
          isChildVisibleWhileBusy ?? this.isChildVisibleWhileBusy,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      backgroundBlurFilter: backgroundBlurFilter ?? this.backgroundBlurFilter,
    );
  }

  /// Provides default settings for [BackgroundProgressSettings] based on the current [BuildContext].
  ///
  /// This method uses the ambient [Theme] to determine appropriate default values
  /// for text styles, colors, and other visual properties.  This ensures that
  /// the background progress indicator is styled in a way that is consistent
  /// with the overall look and feel of the application.
  ///
  /// Returns a [BackgroundProgressSettings] instance with default values derived from the context's theme.
  static BackgroundProgressSettings defaultSettings(BuildContext context) {
    final theme = Theme.of(context);
    return BackgroundProgressSettings(
      messageStyle: theme.textTheme.titleMedium?.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        shadows: [
          BoxShadow(
            color: theme.colorScheme.primaryContainer,
            spreadRadius: 5.0,
            blurRadius: 10.0,
          ),
        ],
      ),
      backgroundColor: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
      progressIndicator: const CircularProgressIndicator(strokeWidth: 3.0),
      backgroundBlurFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
    );
  }
}
