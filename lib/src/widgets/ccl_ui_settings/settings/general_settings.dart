import 'package:ccl_ui/ccl_ui.dart';
import 'package:flutter/material.dart';

/// Represents general UI settings.
///
/// This class holds settings that can be applied to various UI components
/// to control their general appearance and behavior.
class GeneralSettings {
  /// An optional progress indicator to display while the state is busy.
  ///
  /// This widget is typically shown to indicate that an asynchronous operation
  /// is in progress. If null, no progress indicator will be displayed.
  final Widget? progressIndicator;

  /// The text style for error titles.
  ///
  /// This style is used for the title of error messages or dialogs.
  final TextStyle? errorTitleStyle;

  /// The text style for error messages.
  ///
  /// This style is used for the body text of error messages or dialogs.
  final TextStyle? errorMessageStyle;

  /// Creates a new instance of [GeneralSettings].
  ///
  /// [progressIndicator] is an optional widget to display as a progress indicator.
  /// [errorTitleStyle] is an optional text style for error titles.
  /// [errorMessageStyle] is an optional text style for error messages.
  ///
  /// If any of these parameters are not provided, the default settings will be
  /// used when accessing them through the [defaultSettings] factory constructor.
  GeneralSettings({
    this.progressIndicator,
    this.errorTitleStyle,
    this.errorMessageStyle,
  });

  /// Creates a copy of this [GeneralSettings] instance with optional overrides.
  ///
  /// You can provide new values for the parameters to create a new instance
  /// with updated settings. If a parameter is not provided, the value from
  /// the original instance will be used.
  ///
  /// **Parameters:**
  ///
  /// *   [progressIndicator]: An optional new progress indicator to use.
  /// *   [errorTitleStyle]: An optional new text style for error titles.
  /// *   [errorMessageStyle]: An optional new text style for error messages.
  ///
  /// **Returns:**
  ///
  /// A new [GeneralSettings] instance with the updated settings.
  GeneralSettings copyWith({
    Widget? progressIndicator,
    TextStyle? errorTitleStyle,
    TextStyle? errorMessageStyle,
  }) {
    return GeneralSettings(
      progressIndicator: progressIndicator ?? this.progressIndicator,
      errorTitleStyle: errorTitleStyle ?? this.errorTitleStyle,
      errorMessageStyle: errorMessageStyle ?? this.errorMessageStyle,
    );
  }

  /// Provides default general UI settings.
  ///
  /// This factory constructor creates a [GeneralSettings] instance with default
  /// settings.
  ///
  /// The default [progressIndicator] is a [CircularProgressIndicator] with a
  /// stroke width of 3.0.
  ///
  /// The default [errorTitleStyle] is derived from the context's
  /// `styleTitleMedium`, weighted as bold (`w700`), and colored with the
  /// context's error color (`wcError`).
  ///
  /// The default [errorMessageStyle] is derived from the context's
  /// `styleBodyMedium` and colored with the context's error color (`wcError`).
  ///
  /// The [context] is required to provide context-dependent default settings,
  /// such as theme data and text styles.
  static GeneralSettings defaultSettings(BuildContext context) {
    return GeneralSettings(
      progressIndicator: const CircularProgressIndicator(strokeWidth: 3.0),
      errorTitleStyle: context.styleTitleLarge?.w700,
      errorMessageStyle: context.styleBodyMedium,
    );
  }
}
