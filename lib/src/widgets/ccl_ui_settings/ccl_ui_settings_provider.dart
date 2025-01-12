part of 'ccl_ui_configurator.dart';

/// Provides access to [CCLUiSettings] to its descendants.
///
/// This widget uses an [InheritedWidget] to propagate the [CCLUiSettings]
/// object down the widget tree, making it accessible to any descendant
/// widget.
///
/// To use this provider, wrap the root widget of your application with a
/// `CCLUiConfigurator` widget. This ensures that all widgets in your
/// application have access to the provided settings.
///
/// Example:
///
/// ```dart
/// MaterialApp(
///   home: CCLUiConfigurator(
///     child: MyHomePage(),
///   ),
/// )
/// ```
///
/// Access the [CCLUiSettings] object or its properties anywhere in your
/// application using the `of()` and `maybeOf()` methods provided by
/// `CCLUiConfigurator`.
///
/// ```dart
/// CCLUiSettings settings = CCLUiConfigurator.of(context);
/// BackgroundProgressSettings? progressSettings =
///     CCLUiConfigurator.maybeOfBackgroundProgress(context);
/// ```
///
/// If no `CCLUiConfigurator` is found in the widget tree above the
/// calling context and `of()` is used, a [FlutterError] will be thrown.
/// Using `maybeOf()` will return null in this case. Therefore, it's
/// crucial to ensure the configurator is properly placed at the root of
/// your application or above the widgets that need access to the settings.
class _CCLUiSettingsProvider extends InheritedWidget {
  /// The current [CCLUiSettings] object.
  final CCLUiSettings? settings;

  /// Creates a new [_CCLUiSettingsProvider].
  ///
  /// The [child] argument must not be null. If [settings] is null, no settings
  /// will be available through this provider.
  const _CCLUiSettingsProvider({
    required super.child,
    this.settings,
  });

  @override
  bool updateShouldNotify(_CCLUiSettingsProvider oldWidget) {
    return settings != oldWidget.settings;
  }

  /// Retrieves the [CCLUiSettings] from the nearest [_CCLUiSettingsProvider]
  /// ancestor in the widget tree.
  ///
  /// Returns `null` if no [_CCLUiSettingsProvider] is found.
  static CCLUiSettings? maybeOf(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<_CCLUiSettingsProvider>();
    return provider?.settings;
  }

  /// Retrieves the [CCLUiSettings] from the nearest [_CCLUiSettingsProvider]
  /// ancestor in the widget tree.
  ///
  /// Throws a [FlutterError] if no [_CCLUiSettingsProvider] is found.
  static CCLUiSettings of(BuildContext context) {
    final settings = maybeOf(context);
    if (settings == null) {
      throw FlutterError(
        'CCLUiConfigurator.of() called with a context that does not contain a CCLUiConfigurator.\n'
        'No CCLUiConfigurator ancestor could be found starting from the context that was passed to CCLUiConfigurator.of().\n'
        'The context used was: $context',
      );
    }
    return settings;
  }

  /// Retrieves the [BackgroundProgressSettings] from the nearest
  /// [_CCLUiSettingsProvider] ancestor in the widget tree.
  ///
  /// Returns `null` if no [_CCLUiSettingsProvider] is found or if
  /// `backgroundProgressSettings` is null on the settings object.
  static BackgroundProgressSettings? maybeOfBackgroundProgress(
      BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<_CCLUiSettingsProvider>();
    return provider?.settings?.backgroundProgressSettings;
  }

  /// Retrieves the [BackgroundProgressSettings] from the nearest
  /// [_CCLUiSettingsProvider] ancestor in the widget tree.
  ///
  /// Throws a [FlutterError] if no [_CCLUiSettingsProvider] is found or if
  /// `backgroundProgressSettings` is null on the settings object.
  static BackgroundProgressSettings ofBackgroundProgress(BuildContext context) {
    final settings = maybeOfBackgroundProgress(context);
    if (settings == null) {
      throw FlutterError(
        'CCLUiConfigurator.ofBackgroundProgress() called with a context that does not contain a CCLUiConfigurator or the settings do not contain backgroundProgressSettings.\n'
        'No CCLUiConfigurator ancestor could be found starting from the context that was passed to CCLUiConfigurator.ofBackgroundProgress().\n'
        'The context used was: $context',
      );
    }
    return settings;
  }
}
