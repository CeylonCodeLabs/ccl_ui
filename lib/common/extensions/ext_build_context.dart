part of '../common.dart';

/// Extension methods for the BuildContext class.
///
/// This extension provides convenient access to various theme properties,
/// making it easier to use them in your widgets.
extension BuildContextExt on BuildContext {
  /// The current theme of the context.
  ThemeData get theme => Theme.of(this);

  /// The current color scheme of the context.
  ColorScheme get colors => theme.colorScheme;

  /// The current text theme of the context.
  TextTheme get textTheme => theme.textTheme;

  /// The TextStyle for the 'DisplayLarge' text style.
  TextStyle? get styleDisplayLarge => textTheme.displayLarge;

  /// The TextStyle for the 'DisplayMedium' text style.
  TextStyle? get styleDisplayMedium => textTheme.displayMedium;

  /// The TextStyle for the 'DisplaySmall' text style.
  TextStyle? get styleDisplaySmall => textTheme.displaySmall;

  /// The TextStyle for the 'HeadlineLarge' text style.
  TextStyle? get styleHeadlineLarge => textTheme.headlineLarge;

  /// The TextStyle for the 'HeadlineMedium' text style.
  TextStyle? get styleHeadlineMedium => textTheme.headlineMedium;

  /// The TextStyle for the 'HeadlineSmall' text style.
  TextStyle? get styleHeadlineSmall => textTheme.headlineSmall;

  /// The TextStyle for the 'TitleLarge' text style.
  TextStyle? get styleTitleLarge => textTheme.titleLarge;

  /// The TextStyle for the 'TitleMedium' text style.
  TextStyle? get styleTitleMedium => textTheme.titleMedium;

  /// The TextStyle for the 'TitleSmall' text style.
  TextStyle? get styleTitleSmall => textTheme.titleSmall;

  /// The TextStyle for the 'LabelLarge' text style.
  TextStyle? get styleLabelLarge => textTheme.labelLarge;

  /// The TextStyle for the 'LabelMedium' text style.
  TextStyle? get styleLabelMedium => textTheme.labelMedium;

  /// The TextStyle for the 'LabelSmall' text style.
  TextStyle? get styleLabelSmall => textTheme.labelSmall;

  /// The TextStyle for the 'BodyLarge' text style.
  TextStyle? get styleBodyLarge => textTheme.bodyLarge;

  /// The TextStyle for the 'BodyMedium' text style.
  TextStyle? get styleBodyMedium => textTheme.bodyMedium;

  /// The TextStyle for the 'BodySmall' text style.
  TextStyle? get styleBodySmall => textTheme.bodySmall;

  /// Whether system dark mode is currently enabled.
  bool get isSystemDarkMode {
    final brightness = MediaQuery.platformBrightnessOf(this);
    return brightness == Brightness.dark;
  }

  /// Whether dark mode is currently enabled.
  bool get isDarkMode {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark;
  }
}
