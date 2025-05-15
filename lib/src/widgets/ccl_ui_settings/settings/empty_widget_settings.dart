part of '../ccl_ui_configurator.dart';

/// Represents settings for an empty state widget.
///
/// This class holds settings that control the appearance and content of a
/// widget displayed when there is no data to show.
class EmptyWidgetSettings {
  /// An optional graphic to display when the data is empty.
  ///
  /// This widget is typically an icon or image that visually represents the
  /// empty state. If null, no graphic will be displayed.
  final Widget? emptyGraphic;

  /// An optional title to display for the empty state.
  ///
  /// This string provides a brief heading for the empty state message.
  /// If null, no title will be displayed.
  final String? title;

  /// The text style for the empty state title.
  ///
  /// This style is used for the title text. If null, the default title style
  /// from the theme or default settings will be used.
  final TextStyle? titleStyle;

  /// The message to display when the data is empty.
  ///
  /// This string provides a more detailed explanation of the empty state.
  /// Defaults to 'Data not found!'.
  final String message;

  /// The text style for the empty state message.
  ///
  /// This style is used for the message text. If null, the default message style
  /// from the theme or default settings will be used.
  final TextStyle? messageStyle;

  /// Creates a new instance of [EmptyWidgetSettings].
  ///
  /// [emptyGraphic] is an optional widget to display as a graphic.
  /// [title] is an optional string for the title.
  /// [titleStyle] is an optional text style for the title.
  /// [message] is the message to display (defaults to 'Data not found!').
  /// [messageStyle] is an optional text style for the message.
  EmptyWidgetSettings({
    this.emptyGraphic,
    this.title,
    this.titleStyle,
    this.message = 'Data not found!',
    this.messageStyle,
  });

  /// Creates a copy of this [EmptyWidgetSettings] instance with optional overrides.
  ///
  /// You can provide new values for the parameters to create a new instance
  /// with updated settings. If a parameter is not provided, the value from
  /// the original instance will be used.
  ///
  /// **Parameters:**
  ///
  /// *   [emptyGraphic]: An optional new graphic to use.
  /// *   [title]: An optional new title to use.
  /// *   [titleStyle]: An optional new text style for the title.
  /// *   [message]: An optional new message to use.
  /// *   [messageStyle]: An optional new text style for the message.
  ///
  /// **Returns:**
  ///
  /// A new [EmptyWidgetSettings] instance with the updated settings.
  EmptyWidgetSettings copyWith({
    Widget? emptyGraphic,
    String? title,
    TextStyle? titleStyle,
    String? message,
    TextStyle? messageStyle,
  }) {
    return EmptyWidgetSettings(
      emptyGraphic: emptyGraphic ?? this.emptyGraphic,
      title: title ?? this.title,
      titleStyle: titleStyle ?? this.titleStyle,
      message: message ?? this.message,
      messageStyle: messageStyle ?? this.messageStyle,
    );
  }

  /// Provides default settings for an empty state widget.
  ///
  /// This factory constructor creates an [EmptyWidgetSettings] instance with
  /// default settings.
  ///
  /// The default [titleStyle] is derived from the context's `styleTitleMedium`
  /// and colored with the context's primary color (`wcPrimary`).
  ///
  /// The default [messageStyle] is derived from the context's `styleBodyMedium`
  /// and colored with the context's secondary color (`wcSecondary`).
  ///
  /// The default [message] is 'Data not found!'.
  ///
  /// The [context] is required to provide context-dependent default settings,
  /// such as theme data and text styles.
  static EmptyWidgetSettings defaultSettings(BuildContext context) {
    return EmptyWidgetSettings(
      titleStyle: context.styleTitleMedium?.wcPrimary(context),
      messageStyle: context.styleBodyMedium?.wcSecondary(context),
      message: 'Data not found!',
    );
  }
}
