import 'package:ccl_ui/ccl_ui.dart';
import 'package:flutter/material.dart';

part 'ccl_ui_settings_provider.dart';

part 'settings/background_progress_settings.dart';

part 'settings/ccl_ui_settings.dart';

/// Configures and provides access to [CCLUiSettings] for its descendants.
///
/// This widget acts as a central configuration point for CCL UI settings.
/// It uses an [_CCLUiSettingsProvider] to propagate the provided
/// [CCLUiSettings] object down the widget tree, making it accessible to
/// any descendant widget.
///
/// To use this configurator, wrap the root widget of your application or
/// a relevant subtree with a `CCLUiConfigurator` widget.
///
/// Example:
///
/// ```dart
/// MaterialApp(
///   home: CCLUiConfigurator(
///     builder: (context) => MyHomePage(),
///   ),
/// )
/// ```
///
/// Access the [CCLUiSettings] object or its properties anywhere within
/// the configured subtree using the static `of()` and `maybeOf()` methods:
///
/// ```dart
/// CCLUiSettings settings = CCLUiConfigurator.of(context);
/// BackgroundProgressSettings? progressSettings =
///     CCLUiConfigurator.maybeOfBackgroundProgress(context);
/// ```
///
/// The `of()` methods will throw a [FlutterError] if no `CCLUiConfigurator`
/// is found in the widget tree above the calling context. The `maybeOf()`
/// methods will return `null` in this case. Therefore, it's crucial to
/// ensure the configurator is properly placed at the root of your
/// application or above the widgets that need access to the settings.
class CCLUiConfigurator extends StatelessWidget {
  /// A builder function that creates the widget tree to be configured.
  final WidgetBuilder builder;

  /// The [CCLUiSettings] object to be provided.
  ///
  /// If this is null, no settings will be available through this
  /// configurator.
  final CCLUiSettings? settings;

  /// Creates a new [CCLUiConfigurator].
  const CCLUiConfigurator({
    super.key,
    required this.builder,
    this.settings,
  });

  @override
  Widget build(BuildContext context) {
    return _CCLUiSettingsProvider(
      settings: settings,
      child: Builder(builder: builder),
    );
  }

  /// Retrieves the [CCLUiSettings] from the nearest ancestor
  /// `CCLUiConfigurator`.
  ///
  /// Returns `null` if no `CCLUiConfigurator` is found.
  static CCLUiSettings? maybeOf(BuildContext context) =>
      _CCLUiSettingsProvider.maybeOf(context);

  /// Retrieves the [CCLUiSettings] from the nearest ancestor
  /// `CCLUiConfigurator`.
  ///
  /// Throws a [FlutterError] if no `CCLUiConfigurator` is found.
  static CCLUiSettings of(BuildContext context) =>
      _CCLUiSettingsProvider.of(context);

  /// Retrieves the [BackgroundProgressSettings] from the nearest ancestor
  /// `CCLUiConfigurator`.
  ///
  /// Returns `null` if no `CCLUiConfigurator` is found or if the settings
  /// do not contain `backgroundProgressSettings`.
  static BackgroundProgressSettings? maybeOfBackgroundProgress(
          BuildContext context) =>
      _CCLUiSettingsProvider.maybeOfBackgroundProgress(context);

  /// Retrieves the [BackgroundProgressSettings] from the nearest ancestor
  /// `CCLUiConfigurator`.
  ///
  /// Throws a [FlutterError] if no `CCLUiConfigurator` is found or if the
  /// settings do not contain `backgroundProgressSettings`.
  static BackgroundProgressSettings ofBackgroundProgress(
          BuildContext context) =>
      _CCLUiSettingsProvider.ofBackgroundProgress(context);
}
